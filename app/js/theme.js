const defaultTheme = (() => {
  // Get the user's theme preference from local storage
  if (
    typeof localStorage !== "undefined" &&
    localStorage.getItem("theme")
  ) {
    return localStorage.getItem("theme");
  }
  // If the user hasn't explicitly set a preference, check the media query
  if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
    return "dark";
  }
  return "light";
})();

// Put dark class on html tag to enable dark mode
if (defaultTheme === "light") {
  document.documentElement.classList.remove("dark");
} else {
  document.documentElement.classList.add("dark");
}

// Store the user's preference in local storage
window.localStorage.setItem("theme", defaultTheme);


export const setTheme = (theme) => {
  if (theme === "dark") {
    document.documentElement.classList.add("dark");
  } else {
    document.documentElement.classList.remove("dark");
  }
  localStorage.setItem("theme", theme);
}
