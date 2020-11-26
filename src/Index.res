%raw("require('./tailwind.css')")
let logo: string = %raw("require('./assets/logo.png')")

module App = {
  @react.component
  let make = () => {
    <div className="h-screen flex justify-center items-center">
      <div className="px-6 max-w-sm rounded overflow-hidden shadow-lg p-4">
        <img className="w-full" src=logo alt="Sunset in the mountains" />
        <div className="py-4">
          <div className="font-bold text-xl mb-2"> {"RE-Tailwind"->React.string} </div>
          <p className="text-gray-700 text-base">
            {"A reason react starter with tailwind"->React.string}
          </p>
        </div>
        <div className="py-4">
          {["Reason React", "Tailwind"]
          |> Js.Array.map(tag =>
            <span
              key=tag
              className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mt-2">
              {("#" ++ tag)->React.string}
            </span>
          )
          |> React.array}
        </div>
        <Button startCount={1} />
      </div>
    </div>
  }
}

ReactDOMRe.renderToElementWithId(<App />, "root")
