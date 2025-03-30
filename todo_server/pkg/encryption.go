package pkg

import (
	"crypto/md5"
	"encoding/hex"
)

// 盐
const salt = "b2770b84-9a8e-47e9-ae04-9af638b86dac" // 你可以换成更复杂、更安全的盐值

// Md5 使用盐生成 MD5 哈希
func Md5(str string) string {
	hash := md5.New()
	hash.Write([]byte(str + salt)) // 将原始字符串和盐拼接
	return hex.EncodeToString(hash.Sum(nil))
}
