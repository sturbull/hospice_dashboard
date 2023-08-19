

const AppLayout = ({ id, children }) => {

  return (
    <div id={id} className="bg-slate-50 min-h-screen">
      {children}
    </div>
  )
}

export default AppLayout;