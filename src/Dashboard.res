module Item = {
  @react.component
  let make = (~x: option<int>, ~y: option<int>, ~w: int=1, ~h: int=1, ~children) => {
    let rowStart = switch x {
    | Some(v) => (v + 1)->Js.Int.toString
    | None => ""
    }
    let columnStart = switch y {
    | Some(v) => Js.Int.toString(v + 1)
    | None => ""
    }
    <div
      style={ReactDOM.Style.make(
        ~height="100%",
        ~width="100%",
        ~overflow="hidden",
        ~position="relative",
        ~gridRowStart={rowStart},
        ~gridColumnStart={columnStart},
        ~gridRowEnd=`span ${Js.Int.toString(h)}`,
        ~gridColumnEnd=`span ${Js.Int.toString(w)}`,
        (),
      )}>
      {children}
    </div>
  }
}

open Js.Array

@react.component
let make = (
  ~rows: int=1,
  ~columns: int=1,
  ~gap: string="",
  ~children,
  ~fixedRows: Js.Dict.t<string>=Js.Dict.fromArray([]),
  ~fixedColumns: Js.Dict.t<string>=Js.Dict.fromArray([]),
) => {
  let gridRows: string = (
    () => {
      let gr = []
      for i in 0 to rows - 1 {
        let _ = switch Js.Dict.get(fixedRows, Js.Int.toString(i)) {
        | None => gr |> push("1fr")
        | Some(size) => gr |> push(size)
        }
      }
      gr |> joinWith(" ")
    }
  )()

  let gridColumns: string = (
    () => {
      let gc = []
      for i in 0 to columns - 1 {
        let _ = switch Js.Dict.get(fixedColumns, Js.Int.toString(i)) {
        | None => gc |> push("1fr")
        | Some(size) => gc |> push(size)
        }
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
