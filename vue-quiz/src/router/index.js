import { createRouter, createWebHistory } from 'vue-router';
import SignInView from '../views/SignInView.vue';
import RegisterView from '../views/RegisterView.vue';
import WelcomePage from "@/components/Welcome.vue";
import QuizView from '../views/QuizView.vue';
import HighScores from "../components/HighScores.vue";
import HighScoreView from "../views/HighScoreView.vue";
import { session } from '@/stores/session';
import TimerComponent from "@/components/TimerComponent.vue";
import EndView from "@/views/EndView.vue";




const requireAuth = (to, from, next) => {
  if (session.sessionToken) {
    next();
  } else {
    next({ name: 'signin' });
  }
};

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/welcome',
      name: 'WelcomePage',
      component: WelcomePage,
      beforeEnter: requireAuth,
    },

    {
      path: '/end',
      name: 'EndView',
      component: EndView,
      beforeEnter: requireAuth,
    },

    {
      path: '/',
      name: 'signin',
      component: SignInView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView
    },
    {
      path: '/quiz',
      name: 'quiz',
      component: QuizView,
      beforeEnter: requireAuth,
    },
    {
      path: '/highscores',
      name: 'HighScores',
      component: HighScores,
      beforeEnter: requireAuth,
    },
    {
      path: '/highscoreview',
      name: 'HighScoreView',
      component: HighScoreView,
      beforeEnter: requireAuth,
    },
    {
      path: '/timer',
      name: 'Timer',
      component: TimerComponent,
    },
  ]
});

export default router;
