import type { Page } from "@playwright/test";

type TestContext = {
  username: string;
  email: string;
  password: string;
};

let cachedTestCtx: TestContext | null = null;

export function testContext(): TestContext {
  if (!cachedTestCtx) {
    const timestamp = new Date().getTime();
    cachedTestCtx = {
      username: `testuser${timestamp}`,
      email: `${timestamp}+testuser@example.com`,
      password: "tD20xt6h0m3!",
    };
  }
  return cachedTestCtx;
}

export const createTestContext = () => {
  const timestamp = Date.now();
  return {
    username: `testuser${timestamp}`,
    email: `${timestamp}+testuser@example.com`,
    password: 'S0me-R@ndom-P@ssword!'
  };
};