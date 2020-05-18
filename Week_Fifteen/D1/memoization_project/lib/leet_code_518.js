// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

function change(amt, coins, memo={}) {
  let key = amt + '-' + coins;
  if (key in memo) return memo[key];
  if (amt === 0) return 1;

  let currCoin = coins[coins.length-1];
  let total = 0;
  for (let i = 0; i * currCoin <= amt; i++) {
    total += change(amt - i*currCoin, coins.slice(0, -1), memo);
  }

  memo[key] = total;
  return memo[key];
}
