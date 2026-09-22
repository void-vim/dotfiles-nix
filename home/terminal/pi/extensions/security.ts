import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { execFile } from "child_process";

export default function (pi: ExtensionAPI) {
  pi.on("agent_end", async (_event, ctx) => {
    const history = ctx.session?.messages || [];
    const lastMessage = history[history.length - 1];

    if (lastMessage && lastMessage.role === "assistant") {
      const text = lastMessage.content || "";
      
      if (text.includes("Rate limit exceeded") || text.includes("Provider returned error")) {
        execFile("notify-send", [
          "--urgency=critical",
          "Pi Agent Error",
          "Rate limit hit or provider error occurred.",
        ]);
        return;
      }
    }

    let title = "Pi Agent";
    let message = "Ur shit is done";
    let urgency = "normal";

    if (lastMessage && lastMessage.role === "assistant") {
      const text = lastMessage.content || "";
      const isQuestion =
        text.includes("?") ||
        text.toLowerCase().includes("choose") ||
        text.toLowerCase().includes("select");

      if (isQuestion) {
        title = "Pi Choice Required";
        message = "The agent is waiting for your choice or answer.";
        urgency = "critical";
      }
    }

    execFile("notify-send", [
      `--urgency=${urgency}`,
      title,
      message,
    ]);
  });

  pi.on("tool_call", async (event, ctx) => {
    const inputString = JSON.stringify(event.input);
    const inputObj = event.input as Record<string, any>;
    const targetPath = inputObj?.path || "";

    const isDirectEnvAccess =
      (typeof targetPath === "string" && (targetPath === ".env" || targetPath.endsWith("/.env"))) ||
      (event.toolName === "bash" && /\b\.env\b/.test(inputString) && /(cat|less|grep|view|nano|vim|rm|mv)\s+.*\.env/.test(inputString));

    const matchDestructive =
      event.toolName === "bash" && inputString.includes("rm -rf");

    if (isDirectEnvAccess) {
      return { block: true, reason: "Direct .env file access is restricted." };
    }

    if (matchDestructive) {
      execFile("notify-send", [
        "--urgency=critical",
        "Security Trigger",
        `Tool [${event.toolName}] requires confirmation.`,
      ]);

      const confirmed = await ctx.ui.confirm(
        "Security Trigger",
        `Allow tool [${event.toolName}] to run? ${inputString}`
      );

      if (!confirmed) {
        return { block: true, reason: "Blocked by user local extension policy." };
      }
    }
  });
}
