@react.component
let make = () => {
  <div className="h-screen">
    <Grid columns={12} rows={12} gap="10px" fixed={[Grid.Row(0, "70px")]}>
      <Grid.Item w={12} h={1}>
        <div className="p-5 bg-blue-300 h-full"> {"Menu"->React.string} </div>
      </Grid.Item>
      <Grid.Item y={1} w={5} h={4}>
        <div className="p-5 bg-green-300 h-full"> {"Component A"->React.string} </div>
      </Grid.Item>
      <Grid.Item y={5} w={5} h={7}>
        <div className="p-5 bg-purple-300 h-full overflow-y-auto">
          {"Component B "->Js.String2.repeat(1000)->React.string}
        </div>
      </Grid.Item>
      <Grid.Item x={5} y={1} w={7} h={11}>
        <div className="p-5 bg-red-300 h-full"> {"Component C"->React.string} </div>
      </Grid.Item>
    </Grid>
  </div>
}
