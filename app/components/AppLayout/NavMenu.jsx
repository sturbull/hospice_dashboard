const { useState } = React;

const NavMenu = ({ id, children }) => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);

  return (
    <aside className={`h-[calc(100vh-64px)] mt-16 overflow-x-hidden transition-all flex flex-col justify-between gap-2 border-r border-r-slate-300/50 dark:border-r-slate-800/50 ${isSidebarOpen?"w-80": "w-12"}`}>
      <nav className=" min-w-max flex-grow">
        {children}
      </nav>
      <hr className="w-full border-b border-b-slate-100 dark:border-b-slate-800 border-t-0"/>
      <button onClick={()=>setIsSidebarOpen(!isSidebarOpen)} className="pt-2 pb-4 text-slate-400 dark:text-slate-600 text-sm hover:bg-slate-100 dark:hover:bg-slate-800">
        <i className={`fa fa-arrow-right transition-transform ${isSidebarOpen?"rotate-180":"rotate-0"}`} />
      </button>
    </aside>
  )
}

export default NavMenu;
