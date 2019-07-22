import Cookies from 'js-cookie'

const Key = 'medium-key'

export function exist () {
  return Cookies.get(Key) ? true : null
}

export function getToken () {
  return Cookies.getJSON(Key)
}

export function setSession (object) {
  return Cookies.set(Key, object, { expires: 28 }) // Either true or false, indicating if the cookie transmission requires a secure protocol (https).
}

export function removeToken () {
  return Cookies.remove(Key)
}
