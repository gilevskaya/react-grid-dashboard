%raw("require('./tailwind.css')")

module Input = {
  type t =
    | Num(int)
    | Str(string)

  @react.component
  let make = (~name, ~value: t, ~onChange) => {
    let (valueStr, inputType) = switch value {
    | Num(n) => (n->Js.Int.toString, "number")
    | Str(s) => (s, "text")
    }
    <div className="flex justify-between items-center py-2">
      <label className="text-sm text-gray-800"> {name->React.string} </label>
      <input
        type_={inputType}
        className="h-7 border border-gray-300"
        value={valueStr}
        onChange={e => ReactEvent.Form.target(e)["value"]->onChange}
      />
    </div>
  }
}

module ItemMock = {
  @react.component
  let make = (~name) => {
    <div className="h-full bg-gray-300 border border-gray-400 flex items-center justify-center">
      <div className="text-xl font-semibold text-gray-400"> {name->React.string} </div>
    </div>
  }
}

open Js.Array2

module App = {
  type tItemProps = {mutable x: option<int>, mutable y: option<int>}

  @react.component
  let make = () => {
    let (rows, setRows) = React.useState(_ => 3)
    let (columns, setColumns) = React.useState(_ => 2)
    let (gap, setGap) = React.useState(_ => "0.5rem")
    let (items, setItems) = React.useState(_ => [{x: None, y: None}])

    <div className="h-screen p-10 bg-gray-100 flex flex-col">
      <div className="text-3xl mb-8"> {"ReScript CSS Grid Dashboard"->React.string} </div>
      <div className="flex-1 flex w-full">
        <div className="w-full shadow-md bg-gray-200">
          <Dashboard rows columns gap> {items->mapi((item, ind) => {
              let indStr = (ind + 1)->Js.Int.toString
              let {x, y} = item
              <Dashboard.Item key={indStr} x y> <ItemMock name={indStr} /> </Dashboard.Item>
            })->React.array} </Dashboard>
        </div>
        <div className="ml-8 w-96 flex flex-col justify-between">
          <div>
            <div className="text-lg pb-4 font-medium"> {"Settings"->React.string} </div>
            <Input name="rows" value={Input.Num(rows)} onChange={setRows} />
            <Input name="columns" value={Input.Num(columns)} onChange={setColumns} />
            <Input name="gap" value={Input.Str(gap)} onChange={setGap} />
          </div>
          // ...
          <button
            className="uppercase font-semibold text-gray-400 hover:text-gray-600"
            onClick={_ => setItems(prevItems => {
                let _ = prevItems->push({x: None, y: None})
                prevItems->copy
              })}>
            {"+ add Item"->React.string}
          </button>
        </div>
      </div>
    </div>
  }
}

// input[type='text']
// input[type='password']
// input[type='email']
// input[type='number']
// input[type='url']
// input[type='date']
// input[type='datetime-local']
// input[type='month']
// input[type='week']
// input[type='time']
// input[type='search']
// input[type='tel']
// input[type='checkbox']
// input[type='radio']
// select
// select[multiple]
// textarea

ReactDOMRe.renderToElementWithId(<App />, "root")
