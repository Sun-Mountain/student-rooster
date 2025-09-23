import { expect } from "@playwright/test";
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

export async function signUp(page: Page, ctx: TestContext) {
  await page.goto("/sign-up");
  await page.getByLabel("Username").click();
  await page.getByLabel("Username").fill(ctx.username);
  await page.getByLabel("Email").click();
  await page.getByLabel("Email").fill(ctx.email);
  await page.getByRole("textbox", { name: "Password" }).click();
  await page.getByRole("textbox", { name: "Password" }).fill(ctx.password);
  await page.getByRole("button", { name: "Sign Up", exact: true }).click({force:true});
  await expect(page.getByRole("heading", { name: "Login" })).toBeVisible();
};

export async function logIn(page: Page, ctx: TestContext) {
  await page.getByLabel("Email").click();
  await page.getByLabel("Email").fill(ctx.email);
  await page.getByRole("textbox", { name: "Password" }).click();
  await page.getByRole("textbox", { name: "Password" }).fill(ctx.password);
  await page.getByRole("button", { name: "Login", exact: true }).click();
  await expect(page.getByRole("heading", { name: "Dashboard" })).toBeVisible();
};

export async function signOut(page: Page) {
  await expect(page.locator('button[aria-label="Sign out of the application"]')).toBeVisible();
  await page.locator('button[aria-label="Sign out of the application"]').click();
  await expect(page.getByRole("heading", { name: "Welcome to Student Rooster"})).toBeVisible();
};