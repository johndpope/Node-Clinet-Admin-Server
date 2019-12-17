import jsCookie from 'js-cookie'

// const TokenKey = 'Admin-Token'

// cookie 緩存
const cookie = jsCookie.withConverter({
  read: function(value, name) {
      return value;
  },
  write: function(value, name) {
      return value;
  }
});

export function getToken(TokenKey) {
  return cookie.get(TokenKey)
}

export function setToken(TokenKey,token) {
  return cookie.set(TokenKey, token, {
    path: '/'
  })
}

export function removeToken(TokenKey) {
  return cookie.remove(TokenKey)
}
