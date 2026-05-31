import { getDistance } from "./getDistance";

describe("getDistance", () => {
  it("retourne 0 pour deux points identiques", () => {
    const point = { lat: 48.8566, lng: 2.3522 };
    expect(getDistance(point, point)).toBeCloseTo(0, 1);
  });

  it("retourne ~393 km entre Paris et Lyon", () => {
    const paris = { lat: 48.8566, lng: 2.3522 };
    const lyon = { lat: 45.748, lng: 4.8357 };
    expect(getDistance(paris, lyon)).toBeCloseTo(393, -1);
  });

  it("retourne une distance positive pour des points différents", () => {
    const point1 = { lat: 0, lng: 0 };
    const point2 = { lat: 1, lng: 1 };
    expect(getDistance(point1, point2)).toBeGreaterThan(0);
  });

  it("est symétrique (A→B = B→A)", () => {
    const paris = { lat: 48.8566, lng: 2.3522 };
    const london = { lat: 51.5074, lng: -0.1278 };
    expect(getDistance(paris, london)).toBeCloseTo(getDistance(london, paris), 5);
  });
});
