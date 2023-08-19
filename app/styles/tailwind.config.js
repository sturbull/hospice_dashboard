
var gigas = {
  50: "#FAF5FF",
  100: "#F3E8FF",
  200: "#D7BDF3",
  300: "#BB93E4",
  400: "#9E69D5",
  500: "#7F3DC5",
  600: "#612EA7",
  700: "#471F89",
  800: "#300F6A",
  900: "#1A014D",
};

var freefall = {
  50: "#F0F9FF",
  100: "#E5F6FF",
  200: "#B4E2F8",
  300: "#79CCF3",
  400: "#45B6EB",
  500: "#1E9BD5",
  600: "#1A72B0",
  700: "#114C8C",
  800: "#03307A",
  900: "#011D50",
};

var meadow = {
  50: "#EFFFF2",
  100: "#DBFEE5",
  200: "#B8F3D3",
  300: "#7DE4B9",
  400: "#28D7A2",
  500: "#00BA90",
  600: "#1B9982",
  700: "#0E7C6F",
  800: "#106161",
  900: "#043943",
};

var watermelon = {
  50: "#FFF2F6",
  100: "#FFE7EE",
  200: "#FFCDD6",
  300: "#FFAEBC",
  400: "#FF808B",
  500: "#F34867",
  600: "#CC1C57",
  700: "#9C1F52",
  800: "#791544",
  900: "#550E35",
};

var sunflower = {
  50: "#FFFBEB",
  100: "#FEF3C7",
  200: "#FFE39D",
  300: "#FFD362",
  400: "#FFBE19",
  500: "#F59E0B",
  600: "#CB6506",
  700: "#AF4010",
  800: "#81280B",
  900: "#601E09",
};

tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        sans: [
          "var(--font-sans)",
          tailwind.defaultTheme.fontFamily.sans
        ],
      },
      colors: {
        "primary": gigas,
      }
    }
  }
}