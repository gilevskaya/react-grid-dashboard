%raw("require('./tailwind.css')")

// for types Js.Types
type tItemProps = {mutable x: option<int>, mutable y: option<int>}

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

module ItemInput = {
  module Value = {
    @react.component
    let make = (~name, ~value, ~setValue) => {
      let valueStr = switch value {
      | Some(n) => n->Js.Int.toString
      | None => ""
      }
      <div className="flex flex-col flex-1 border-t border-b border-r border-gray-300 w-1/4">
        <label> {name->React.string} </label>
        <input
        // type_="number"
          className="w-full"
          value={valueStr}
          onChange={e => {
            let v = ReactEvent.Form.target(e)["value"]
            if v === "" {
              setValue(None)
            } else {
              setValue(Some(v->Js.Float.fromString->Belt.Float.toInt))
            }
          }}
        />
      </div>
    }
  }

  @react.component
  let make = (~id: int, ~item: tItemProps, ~setItem) => {
    <div className="my-4 flex">
      <div className="w-8 border-r border-gray-300"> {id->Js.Int.toString->React.string} </div>
      <Value name="x" value={item.x} setValue={v => setItem({...item, x: v})} />
      <Value name="y" value={item.y} setValue={v => setItem({...item, y: v})} />
      // <Value name="w" value={item.w} />
      // <Value name="h" value={item.h} />
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
  @react.component
  let make = () => {
    let (rows, setRows) = React.useState(_ => 6)
    let (columns, setColumns) = React.useState(_ => 3)
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
            <div>
              <div className="text-lg pb-4 font-medium"> {"Settings"->React.string} </div>
              <Input name="rows" value={Input.Num(rows)} onChange={setRows} />
              <Input name="columns" value={Input.Num(columns)} onChange={setColumns} />
              <Input name="gap" value={Input.Str(gap)} onChange={setGap} />
            </div>
            <div className="pt-3"> {items->mapi((item, ind) => {
                <ItemInput
                  key={(ind + 1)->Js.Int.toString}
                  id={ind + 1}
                  item
                  setItem={i => {
                    setItems(items => {
                      let _ = Belt.Array.set(items, ind, i)
                      items->copy
                    })
                  }}
                />
              })->React.array} </div>
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
