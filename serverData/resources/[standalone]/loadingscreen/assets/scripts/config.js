Config = {}; // Don't touch

Config.ServerIP = "localhost";

// Social media buttons on the left side
Config.Socials = [
  {
    name: "discord",
    label: "Discord",
    description: "Click here to copy the link and join our Discord server!",
    icon: "assets/media/icons/discord.png",
    link: "https://discord.gg/YCwrKzkuvw",
  },
  {
    name: "instagram",
    label: "Instagram",
    description:
      "An Instagram page will open for us soon, feel free to join and follow us!",
    icon: "assets/media/icons/tiktok.png",
    link: "#",
  },
  {
    name: "tebex",
    label: "Donations",
    description:
      "For donations, feel free to look at the room - #Donations at Discord.",
    icon: "assets/media/icons/tebex.png",
    link: "#",
  },
];

Config.HideoverlayKeybind = 112; // JS key code https://keycode.info
Config.CustomBindText = "F1"; // leave as "" if you don't want the bind text in html to be statically set

// Staff list
Config.Staff = [
  {
    name: "Nmsh #1",
    description: "Owner & Dev",
    color: "#ff0000",
    image:
      "https://cdn.discordapp.com/attachments/1065234419000025148/1144024626784125028/png.png",
  },
];

// Categories
Config.Categories = [
  { label: "Social Media", default: true },
  { label: "Staff", default: false },
];

// Music
Config.Song = "";
