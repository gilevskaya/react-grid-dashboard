@genType
module Item = {
  @react.component
  export make = (~x: option<int>, ~y: option<int>, ~w: option<int>, ~h: option<int>, ~children) => {
    let columnStart = switch x {
    | Some(v) => (v + 1)->Js.Int.toString
    | None => ""
    }
    let rowStart = switch y {
    | Some(v) => Js.Int.toString(v + 1)
    | None => ""
    }
    let columnEnd = switch w {
    | Some(v) => v->Js.Int.toString
    | None => "1"
    }
    let rowEnd = switch h {
    | Some(v) => v->Js.Int.toString
    | None => "1"
    }
    <div
      style={ReactDOM.Style.make(
        ~height="100%",
        ~width="100%",
        ~overflow="hidden",
        ~position="relative",
        ~gridRowStart={rowStart},
        ~gridColumnStart={columnStart},
        ~gridRowEnd=`span ${rowEnd}`,
        ~gridColumnEnd=`span ${columnEnd}`,
        (),
      )}>
      {children}
    </div>
  }
}

open Js.Array

@genType @react.component
export make = (~rows: int=1, ~columns: int=1, ~gap: string="", ~children) => {
  // ~fixedRows: Js.Dict.t<string>=Js.Dict.fromArray([]),
  // ~fixedColumns: Js.Dict.t<string>=Js.Dict.fromArray([]),

  let gridRows: string = (
    () => {
      let gr = []
      for i in 0 to rows - 1 {
        let _ = gr |> push("1fr")
        // let _ = switch Js.Dict.get(fixedRows, Js.Int.toString(i)) {
        // | None => gr |> push("1fr")
        // | Some(size) => gr |> push(size)
        // }
      }
      gr |> joinWith(" ")
    }
  )()

  let gridColumns: string = (
    () => {
      let gc = []
      for i in 0 to columns - 1 {
        let _ = gc |> push("1fr")
        // let _ = switch Js.Dict.get(fixedColumns, Js.Int.toString(i)) {
        // | None => gc |> push("1fr")
        // | Some(size) => gc |> push(size)
        // }
      }
      gc |> joinWith(" ")
    }
  )()

  <div
    style={ReactDOM.Style.make(
      ~height="100%",
      ~width="100%",
      ~display="grid",
      ~gridGap=gap,
      ~gridTemplateRows=gridRows,
      ~gridTemplateColumns=gridColumns,
      (),
    )}>
    {children}
  </div>
}

export default = {
  "Dashboard": make,
  "Item": Item.make,
}
