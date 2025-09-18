import { test, expect } from '@playwright/test';

test('is responsive', async ({ page }) => {
  await page.goto('/');
  // Set viewport to mobile size
  await page.setViewportSize({ width: 375, height: 667 });
  // Check if the mobile menu button is visible
  const menuButton = page.locator('button[aria-label="Open navigation menu"]');
  await expect(menuButton).toBeVisible();
  // Click the mobile menu button
  await menuButton.click();
  // Check if the mobile menu is displayed
  const mobileMenu = page.locator('div[aria-label="Navigation Menu"]');
  await expect(mobileMenu).toBeVisible();
  // Set viewport back to desktop size
  await page.setViewportSize({ width: 1280, height: 800 });
  // Check if the mobile menu button is hidden
  await expect(menuButton).toBeHidden();
  // Check if the desktop navigation is visible
  const desktopNav = page.locator('div[aria-label="Main navigation"]');
  await expect(desktopNav).toBeVisible();
});