Js.log("Hello, World!")

@react.component
let make = (~startCount: int) => {
  let (count, setCount) = React.useState(_ => startCount)
  let times = switch count {
  | 1 => "once"
  | 2 => "twice"
  | n => Belt.Int.toString(n) ++ " times"
  }
  let msg = "Click me " ++ times

  <button
    className="p-3 mt-5 border border-primary text-primary hover:bg-blue-100 focus:outline-none"
    onClick={_ => setCount(c => c + 1)}>
    {msg->React.string}
  </button>
}
