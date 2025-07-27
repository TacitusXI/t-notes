CTF Writeup Template – by Tacitvs

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💥 Title: [Challenge name]

> "Exploit is art. The system is just an unpainted canvas."
> — Tacitvs

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 OBJECTIVE:
Brief description of the challenge. What is the goal to solve or exploit?

Example:
- Steal tokens from the vault
- Become the contract owner
- Bypass access control
- Drain ETH from protocol

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🧠 MINDSET / THOUGHT PROCESS:
What questions did I ask myself? What caught my eye?

- Is there any delegatecall?
- Can storage be manipulated?
- Are there unsafe assumptions?
- Where’s the weakest trust boundary?

> "Bugs grow in the shadow of unchecked assumptions."

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📜 CONTRACT ANALYSIS:
Paste or summarize relevant parts of the smart contract, with your annotations.

Example:
- This fallback function leads to delegatecall into an untrusted contract.
- Owner is initialized via tx.origin — we can hijack this.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💣 EXPLOIT STRATEGY:
Step-by-step breakdown of the plan to hack.

1. Deploy helper contract
2. Trigger fallback to redirect logic
3. Drain assets via reentrancy or logic flaw

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀 PROOF OF CONCEPT (PoC):
- Include code, `cast` commands, or detailed logic
- Optional: Foundry script or Hardhat script used

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 KNOWLEDGE LINKS:
- delegatecall attack
- reentrancy
- uninitialized proxy

You can reference your own notes here.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🧘 REFLECTION:
What did I learn from this challenge?
What was beautiful or dangerous in this design?
Would I have caught this in a real audit?

> "The world is broken. That’s what makes it hackable."

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✒️ SIGNATURE:
Tacitvs – interpreted, not just solved.
