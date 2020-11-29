import Grid from "react-grid-dashboard";

const layout = {
  // w=1 h=1 – default and can be ommited
  // if no x or y is set grid will auto position the item
  menu: { w: 12 },
  a: { y: 1, w: 5, h: 4 },
  b: { y: 5, w: 5, h: 7 },
  c: { y: 1, x: 5, w: 7, h: 11 },
};

export const App = () => {
  return (
    <div style={{ height: "100vh" }}>
      <Grid.Dashboard columns={12} rows={12} gap="10px">
        <>
          <Grid.Item {...layout.menu}>
            <div
              style={{
                padding: 10,
                background: "Turquoise",
                height: "100%",
              }}
            >
              Fixed height menu
            </div>
          </Grid.Item>
          <Grid.Item {...layout.a}>
            <div
              style={{
                padding: 10,
                background: "LightSkyBlue",
                height: "100%",
              }}
            >
              Component A
            </div>
          </Grid.Item>
          <Grid.Item {...layout.b}>
            <div
              style={{
                padding: 10,
                background: "LightGreen",
                height: "100%",
                overflowY: "auto", // adds scrollable
              }}
            >
              {"Component B, scrollable; ".repeat(100)}
            </div>
          </Grid.Item>
          <Grid.Item {...layout.c}>
            <div
              style={{
                padding: 10,
                background: "LightGray",
                height: "100%",
              }}
            >
              Component C
            </div>
          </Grid.Item>
        </>
      </Grid.Dashboard>
    </div>
  );
};
