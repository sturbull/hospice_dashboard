const { useState } = React;

const AppLayout = ({ id, children, navMenu }) => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  return (
    <div id={id} className="bg-slate-50 min-h-screen flex">
    <aside className={`min-h-screen overflow-x-hidden transition-all flex flex-col justify-between gap-2 bg-slate-100 ${isSidebarOpen?"w-80": "w-10"}`}>
      <nav className=" min-w-max flex-grow">
        {navMenu}
      </nav>
      <hr className="w-full border border-b border-slate-200"/>
      <button onClick={()=>setIsSidebarOpen(!isSidebarOpen)}>Toggle</button>
    </aside>
    <main className="flex-grow">
      {children}
      </main>
    </div>
  )
}

export default AppLayout;