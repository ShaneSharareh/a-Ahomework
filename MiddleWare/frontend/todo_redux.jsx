import React from 'react';
import ReactDOM, { unstable_renderSubtreeIntoContainer } from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  /* Phase 2
  store = applyMiddlewares(store,addLoggingToDispatch);
  */
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

/*Phase 2
const addLoggingToDispatch = store => next => action => {
  console.log('Action recieved:', action);
  console.log('State Before dispatch:', store.getState());
  next(action);
  console.log('State post-dispatch:', store.getState());
  }

  const applyMiddlewares = (store,...middleWares) => {
    let dispatch = store.dispatch;
    middleWares.forEach(middleWare => {
        dispatch = middleWare(store)(dispatch)
    });
    return Object.assign({},store,{dispatch})
  }
*/
/* Phase 1
const addLoggingToDispatch = (store) =>{
  const dispatchedStore = store.dispatch;
  return (action) =>{
    console.log(store.getState())
    console.log(action)
    dispatchedStore(action)
    console.log(store.getState())
  }
}*/