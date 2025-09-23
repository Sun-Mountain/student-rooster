import { test, expect } from '@playwright/test';
import {
  logIn,
  signUp,
  signOut,
  testContext
} from './spec.helpers';

const ctx = testContext();

test('smoke', async ({ page }) => {
  await signUp(page, ctx);
  await logIn(page, ctx);
  await signOut(page);
});