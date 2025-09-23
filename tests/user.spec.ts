import { test, expect } from '@playwright/test';
import {
  signIn,
  signUp,
  signOut,
  testContext
} from './spec.helpers';

const ctx = testContext();

test('smoke', async ({ page }) => {
  await signUp(page, ctx);
  await signIn(page, ctx);
  await signOut(page);
});