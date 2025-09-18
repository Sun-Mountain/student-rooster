import { test, expect } from '@playwright/test';
import {
  testContext
} from './spec.helpers';

const ctx = testContext();

test('smoke', async ({ page }) => {
  await page.goto("/sign-up");
  await expect(async () => {
    await page.getByLabel("Username").click();
    await page.getByLabel("Username").fill(ctx.username);
    await page.getByLabel("Email").click();
    await page.getByLabel("Email").fill(ctx.email);
    await page.getByRole("textbox", { name: "Password" }).click();
    await page.getByRole("textbox", { name: "Password" }).fill(ctx.password);
    await page.getByRole("button", { name: "Sign Up", exact: true }).click({force:true});
    await page.getByTitle("Login").isVisible();
  }).toPass();
  await page.getByLabel("Email").click();
  await page.getByLabel("Email").fill(ctx.email);
  await page.getByRole("textbox", { name: "Password" }).click();
  await page.getByRole("textbox", { name: "Password" }).fill(ctx.password);
  await expect(async () => {
    await page.getByRole("button", { name: "Login", exact: true }).click();
    await page.getByText("Dashboard").isVisible();
    await page.locator('button[aria-label="Sign out of the application"]').isVisible();
  }).toPass();
  await page.locator('button[aria-label="Sign out of the application"]').click();
});