import HelloWorld from "@/components/HelloWorld.vue";
import { describe, expect, test } from "vitest";

describe("HelloWorld", () => {
  test("hello world", async () => {
    expect("HelloWorld").toBe(HelloWorld.__name);
  });
});
