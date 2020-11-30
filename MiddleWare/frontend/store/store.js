import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import {applyMiddleware} from 'redux'
const configureStore = (preloadedState = {}) => {
  //phase 3 of passing in a call to redux's applyMiddleWare with an arg of addLoggingToDispatch
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

//Phase 3
const addLoggingToDispatch = store => next => action => {
  console.log('Action recieved:', action);
  console.log('State Before dispatch:', store.getState());
  next(action);
  console.log('State post-dispatch:', store.getState());
  };

export default configureStore;
