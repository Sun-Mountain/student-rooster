import { NextResponse } from 'next/server';
import { NextRequest } from 'next/server';
import { PUBLIC_ROUTES, ROOT } from '@lib/routes';
import { getToken } from 'next-auth/jwt';

export async function middleware(req: NextRequest) {
  const token = await getToken({ req });
  const { nextUrl } = req;

  if (PUBLIC_ROUTES.includes(nextUrl.pathname)) {
    return NextResponse.next();
  }
  
  
  if (!token) {
    return NextResponse.redirect(new URL('/sign-in', req.url));
  }

  return NextResponse.next();
}

export const config = {
 matcher: ['/((?!api|_next/static|_next/image|favicon.ico).*)'],
};