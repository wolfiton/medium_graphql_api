
import { exist } from './auth'

const routes = [
  {
    path: '/',
    component: () => import('layouts/MyLayout.vue'),
    children: [
      { path: '', component: () => import('pages/Index.vue') },
      { path: '/secret', meta: { requiresAuth: true }, component: () => import('pages/Secret.vue') },
      { path: '/signin',
        component: () => import('pages/SignIn.vue'),
        beforeEnter: (to, from, next) => {
          if (exist() !== null ) {
            next({
              path: '/',
              query: { redirect: to.fullPath }
            })
          } else {
            next()
          }
        }
      },
      { path: '/signup',
        component: () => import('pages/SignUp.vue'),
        beforeEnter: (to, from, next) => {
          if (exist() !== null ) {
            next({
              path: '/',
              query: { redirect: to.fullPath }
            })
          } else {
            next()
          }
        }
      },
    ],
  },
];

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue'),
  });
}

export default routes;
