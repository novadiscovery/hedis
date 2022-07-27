{-# LANGUAGE OverloadedStrings, FlexibleContexts #-}

module Database.Redis.Commands (

-- ** Connection
auth, -- |Authenticate to the server (<http://redis.io/commands/auth>). Since Redis 1.0.0
echo, -- |Echo the given string (<http://redis.io/commands/echo>). Since Redis 1.0.0
ping, -- |Ping the server (<http://redis.io/commands/ping>). Since Redis 1.0.0
quit, -- |Close the connection (<http://redis.io/commands/quit>). Since Redis 1.0.0
select, -- |Change the selected database for the current connection (<http://redis.io/commands/select>). Since Redis 1.0.0

-- ** Keys
del, -- |Delete a key (<http://redis.io/commands/del>). Since Redis 1.0.0
dump, -- |Return a serialized version of the value stored at the specified key (<http://redis.io/commands/dump>). Since Redis 2.6.0
exists, -- |Determine if a key exists (<http://redis.io/commands/exists>). Since Redis 1.0.0
expire, -- |Set a key's time to live in seconds (<http://redis.io/commands/expire>). Since Redis 1.0.0
expireat, -- |Set the expiration for a key as a UNIX timestamp (<http://redis.io/commands/expireat>). Since Redis 1.2.0
keys, -- |Find all keys matching the given pattern (<http://redis.io/commands/keys>). Since Redis 1.0.0
MigrateOpts(..),
defaultMigrateOpts,
migrate, -- |Atomically transfer a key from a Redis instance to another one (<http://redis.io/commands/migrate>). The Redis command @MIGRATE@ is split up into 'migrate', 'migrateMultiple'. Since Redis 2.6.0
migrateMultiple, -- |Atomically transfer a key from a Redis instance to another one (<http://redis.io/commands/migrate>). The Redis command @MIGRATE@ is split up into 'migrate', 'migrateMultiple'. Since Redis 2.6.0
move, -- |Move a key to another database (<http://redis.io/commands/move>). Since Redis 1.0.0
objectRefcount, -- |Inspect the internals of Redis objects (<http://redis.io/commands/object>). The Redis command @OBJECT@ is split up into 'objectRefcount', 'objectEncoding', 'objectIdletime'. Since Redis 2.2.3
objectEncoding, -- |Inspect the internals of Redis objects (<http://redis.io/commands/object>). The Redis command @OBJECT@ is split up into 'objectRefcount', 'objectEncoding', 'objectIdletime'. Since Redis 2.2.3
objectIdletime, -- |Inspect the internals of Redis objects (<http://redis.io/commands/object>). The Redis command @OBJECT@ is split up into 'objectRefcount', 'objectEncoding', 'objectIdletime'. Since Redis 2.2.3
persist, -- |Remove the expiration from a key (<http://redis.io/commands/persist>). Since Redis 2.2.0
pexpire, -- |Set a key's time to live in milliseconds (<http://redis.io/commands/pexpire>). Since Redis 2.6.0
pexpireat, -- |Set the expiration for a key as a UNIX timestamp specified in milliseconds (<http://redis.io/commands/pexpireat>). Since Redis 2.6.0
pttl, -- |Get the time to live for a key in milliseconds (<http://redis.io/commands/pttl>). Since Redis 2.6.0
randomkey, -- |Return a random key from the keyspace (<http://redis.io/commands/randomkey>). Since Redis 1.0.0
rename, -- |Rename a key (<http://redis.io/commands/rename>). Since Redis 1.0.0
renamenx, -- |Rename a key, only if the new key does not exist (<http://redis.io/commands/renamenx>). Since Redis 1.0.0
restore, -- |Create a key using the provided serialized value, previously obtained using DUMP (<http://redis.io/commands/restore>). The Redis command @RESTORE@ is split up into 'restore', 'restoreReplace'. Since Redis 2.6.0
restoreReplace, -- |Create a key using the provided serialized value, previously obtained using DUMP (<http://redis.io/commands/restore>). The Redis command @RESTORE@ is split up into 'restore', 'restoreReplace'. Since Redis 2.6.0
Cursor,
cursor0,
ScanOpts(..),
defaultScanOpts,
scan, -- |Incrementally iterate the keys space (<http://redis.io/commands/scan>). The Redis command @SCAN@ is split up into 'scan', 'scanOpts'. Since Redis 2.8.0
scanOpts, -- |Incrementally iterate the keys space (<http://redis.io/commands/scan>). The Redis command @SCAN@ is split up into 'scan', 'scanOpts'. Since Redis 2.8.0
SortOpts(..),
defaultSortOpts,
SortOrder(..),
sort, -- |Sort the elements in a list, set or sorted set (<http://redis.io/commands/sort>). The Redis command @SORT@ is split up into 'sort', 'sortStore'. Since Redis 1.0.0
sortStore, -- |Sort the elements in a list, set or sorted set (<http://redis.io/commands/sort>). The Redis command @SORT@ is split up into 'sort', 'sortStore'. Since Redis 1.0.0
ttl, -- |Get the time to live for a key (<http://redis.io/commands/ttl>). Since Redis 1.0.0
RedisType(..),
getType, -- |Determine the type stored at key (<http://redis.io/commands/type>). Since Redis 1.0.0
wait, -- |Wait for the synchronous replication of all the write commands sent in the context of the current connection (<http://redis.io/commands/wait>). Since Redis 3.0.0

-- ** Hashes
hdel, -- |Delete one or more hash fields (<http://redis.io/commands/hdel>). Since Redis 2.0.0
hexists, -- |Determine if a hash field exists (<http://redis.io/commands/hexists>). Since Redis 2.0.0
hget, -- |Get the value of a hash field (<http://redis.io/commands/hget>). Since Redis 2.0.0
hgetall, -- |Get all the fields and values in a hash (<http://redis.io/commands/hgetall>). Since Redis 2.0.0
hincrby, -- |Increment the integer value of a hash field by the given number (<http://redis.io/commands/hincrby>). Since Redis 2.0.0
hincrbyfloat, -- |Increment the float value of a hash field by the given amount (<http://redis.io/commands/hincrbyfloat>). Since Redis 2.6.0
hkeys, -- |Get all the fields in a hash (<http://redis.io/commands/hkeys>). Since Redis 2.0.0
hlen, -- |Get the number of fields in a hash (<http://redis.io/commands/hlen>). Since Redis 2.0.0
hmget, -- |Get the values of all the given hash fields (<http://redis.io/commands/hmget>). Since Redis 2.0.0
hmset, -- |Set multiple hash fields to multiple values (<http://redis.io/commands/hmset>). Since Redis 2.0.0
hscan, -- |Incrementally iterate hash fields and associated values (<http://redis.io/commands/hscan>). The Redis command @HSCAN@ is split up into 'hscan', 'hscanOpts'. Since Redis 2.8.0
hscanOpts, -- |Incrementally iterate hash fields and associated values (<http://redis.io/commands/hscan>). The Redis command @HSCAN@ is split up into 'hscan', 'hscanOpts'. Since Redis 2.8.0
hset, -- |Set the string value of a hash field (<http://redis.io/commands/hset>). Since Redis 2.0.0
hsetnx, -- |Set the value of a hash field, only if the field does not exist (<http://redis.io/commands/hsetnx>). Since Redis 2.0.0
hstrlen, -- |Get the length of the value of a hash field (<http://redis.io/commands/hstrlen>). Since Redis 3.2.0
hvals, -- |Get all the values in a hash (<http://redis.io/commands/hvals>). Since Redis 2.0.0

-- ** HyperLogLogs
pfadd, -- |Adds all the elements arguments to the HyperLogLog data structure stored at the variable name specified as first argument (<http://redis.io/commands/pfadd>). Since Redis 2.8.9
pfcount, -- |Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s) (<http://redis.io/commands/pfcount>). Since Redis 2.8.9
pfmerge, -- |Merge N different HyperLogLogs into a single one (<http://redis.io/commands/pfmerge>). Since Redis 2.8.9

-- ** Lists
blpop, -- |Remove and get the first element in a list, or block until one is available (<http://redis.io/commands/blpop>). Since Redis 2.0.0
brpop, -- |Remove and get the last element in a list, or block until one is available (<http://redis.io/commands/brpop>). Since Redis 2.0.0
brpoplpush, -- |Pop a value from a list, push it to another list and return it; or block until one is available (<http://redis.io/commands/brpoplpush>). Since Redis 2.2.0
lindex, -- |Get an element from a list by its index (<http://redis.io/commands/lindex>). Since Redis 1.0.0
linsertBefore, -- |Insert an element before or after another element in a list (<http://redis.io/commands/linsert>). The Redis command @LINSERT@ is split up into 'linsertBefore', 'linsertAfter'. Since Redis 2.2.0
linsertAfter, -- |Insert an element before or after another element in a list (<http://redis.io/commands/linsert>). The Redis command @LINSERT@ is split up into 'linsertBefore', 'linsertAfter'. Since Redis 2.2.0
llen, -- |Get the length of a list (<http://redis.io/commands/llen>). Since Redis 1.0.0
lpop, -- |Remove and get the first element in a list (<http://redis.io/commands/lpop>). Since Redis 1.0.0
lpush, -- |Prepend one or multiple values to a list (<http://redis.io/commands/lpush>). Since Redis 1.0.0
lpushx, -- |Prepend a value to a list, only if the list exists (<http://redis.io/commands/lpushx>). Since Redis 2.2.0
lrange, -- |Get a range of elements from a list (<http://redis.io/commands/lrange>). Since Redis 1.0.0
lrem, -- |Remove elements from a list (<http://redis.io/commands/lrem>). Since Redis 1.0.0
lset, -- |Set the value of an element in a list by its index (<http://redis.io/commands/lset>). Since Redis 1.0.0
ltrim, -- |Trim a list to the specified range (<http://redis.io/commands/ltrim>). Since Redis 1.0.0
rpop, -- |Remove and get the last element in a list (<http://redis.io/commands/rpop>). Since Redis 1.0.0
rpoplpush, -- |Remove the last element in a list, prepend it to another list and return it (<http://redis.io/commands/rpoplpush>). Since Redis 1.2.0
rpush, -- |Append one or multiple values to a list (<http://redis.io/commands/rpush>). Since Redis 1.0.0
rpushx, -- |Append a value to a list, only if the list exists (<http://redis.io/commands/rpushx>). Since Redis 2.2.0

-- ** Scripting
eval, -- |Execute a Lua script server side (<http://redis.io/commands/eval>). Since Redis 2.6.0
evalsha, -- |Execute a Lua script server side (<http://redis.io/commands/evalsha>). Since Redis 2.6.0
DebugMode,
scriptDebug, -- |Set the debug mode for executed scripts (<http://redis.io/commands/script-debug>). Since Redis 3.2.0
scriptExists, -- |Check existence of scripts in the script cache (<http://redis.io/commands/script-exists>). Since Redis 2.6.0
scriptFlush, -- |Remove all the scripts from the script cache (<http://redis.io/commands/script-flush>). Since Redis 2.6.0
scriptKill, -- |Kill the script currently in execution (<http://redis.io/commands/script-kill>). Since Redis 2.6.0
scriptLoad, -- |Load the specified Lua script into the script cache (<http://redis.io/commands/script-load>). Since Redis 2.6.0

-- ** Server
bgrewriteaof, -- |Asynchronously rewrite the append-only file (<http://redis.io/commands/bgrewriteaof>). Since Redis 1.0.0
bgsave, -- |Asynchronously save the dataset to disk (<http://redis.io/commands/bgsave>). Since Redis 1.0.0
clientGetname, -- |Get the current connection name (<http://redis.io/commands/client-getname>). Since Redis 2.6.9
clientList, -- |Get the list of client connections (<http://redis.io/commands/client-list>). Since Redis 2.4.0
clientPause, -- |Stop processing commands from clients for some time (<http://redis.io/commands/client-pause>). Since Redis 2.9.50
ReplyMode,
clientReply, -- |Instruct the server whether to reply to commands (<http://redis.io/commands/client-reply>). Since Redis 3.2
clientSetname, -- |Set the current connection name (<http://redis.io/commands/client-setname>). Since Redis 2.6.9
commandCount, -- |Get total number of Redis commands (<http://redis.io/commands/command-count>). Since Redis 2.8.13
commandInfo, -- |Get array of specific Redis command details (<http://redis.io/commands/command-info>). Since Redis 2.8.13
configGet, -- |Get the value of a configuration parameter (<http://redis.io/commands/config-get>). Since Redis 2.0.0
configResetstat, -- |Reset the stats returned by INFO (<http://redis.io/commands/config-resetstat>). Since Redis 2.0.0
configRewrite, -- |Rewrite the configuration file with the in memory configuration (<http://redis.io/commands/config-rewrite>). Since Redis 2.8.0
configSet, -- |Set a configuration parameter to the given value (<http://redis.io/commands/config-set>). Since Redis 2.0.0
dbsize, -- |Return the number of keys in the selected database (<http://redis.io/commands/dbsize>). Since Redis 1.0.0
debugObject, -- |Get debugging information about a key (<http://redis.io/commands/debug-object>). Since Redis 1.0.0
flushall, -- |Remove all keys from all databases (<http://redis.io/commands/flushall>). Since Redis 1.0.0
flushdb, -- |Remove all keys from the current database (<http://redis.io/commands/flushdb>). Since Redis 1.0.0
info, -- |Get information and statistics about the server (<http://redis.io/commands/info>). The Redis command @INFO@ is split up into 'info', 'infoSection'. Since Redis 1.0.0
infoSection, -- |Get information and statistics about the server (<http://redis.io/commands/info>). The Redis command @INFO@ is split up into 'info', 'infoSection'. Since Redis 1.0.0
lastsave, -- |Get the UNIX time stamp of the last successful save to disk (<http://redis.io/commands/lastsave>). Since Redis 1.0.0
save, -- |Synchronously save the dataset to disk (<http://redis.io/commands/save>). Since Redis 1.0.0
slaveof, -- |Make the server a slave of another instance, or promote it as master (<http://redis.io/commands/slaveof>). Since Redis 1.0.0
Slowlog(..),
slowlogGet, -- |Manages the Redis slow queries log (<http://redis.io/commands/slowlog>). The Redis command @SLOWLOG@ is split up into 'slowlogGet', 'slowlogLen', 'slowlogReset'. Since Redis 2.2.12
slowlogLen, -- |Manages the Redis slow queries log (<http://redis.io/commands/slowlog>). The Redis command @SLOWLOG@ is split up into 'slowlogGet', 'slowlogLen', 'slowlogReset'. Since Redis 2.2.12
slowlogReset, -- |Manages the Redis slow queries log (<http://redis.io/commands/slowlog>). The Redis command @SLOWLOG@ is split up into 'slowlogGet', 'slowlogLen', 'slowlogReset'. Since Redis 2.2.12
time, -- |Return the current server time (<http://redis.io/commands/time>). Since Redis 2.6.0

-- ** Sets
sadd, -- |Add one or more members to a set (<http://redis.io/commands/sadd>). Since Redis 1.0.0
scard, -- |Get the number of members in a set (<http://redis.io/commands/scard>). Since Redis 1.0.0
sdiff, -- |Subtract multiple sets (<http://redis.io/commands/sdiff>). Since Redis 1.0.0
sdiffstore, -- |Subtract multiple sets and store the resulting set in a key (<http://redis.io/commands/sdiffstore>). Since Redis 1.0.0
sinter, -- |Intersect multiple sets (<http://redis.io/commands/sinter>). Since Redis 1.0.0
sinterstore, -- |Intersect multiple sets and store the resulting set in a key (<http://redis.io/commands/sinterstore>). Since Redis 1.0.0
sismember, -- |Determine if a given value is a member of a set (<http://redis.io/commands/sismember>). Since Redis 1.0.0
smembers, -- |Get all the members in a set (<http://redis.io/commands/smembers>). Since Redis 1.0.0
smove, -- |Move a member from one set to another (<http://redis.io/commands/smove>). Since Redis 1.0.0
spop, -- |Remove and return one or multiple random members from a set (<http://redis.io/commands/spop>). The Redis command @SPOP@ is split up into 'spop', 'spopN'. Since Redis 1.0.0
spopN, -- |Remove and return one or multiple random members from a set (<http://redis.io/commands/spop>). The Redis command @SPOP@ is split up into 'spop', 'spopN'. Since Redis 1.0.0
srandmember, -- |Get one or multiple random members from a set (<http://redis.io/commands/srandmember>). The Redis command @SRANDMEMBER@ is split up into 'srandmember', 'srandmemberN'. Since Redis 1.0.0
srandmemberN, -- |Get one or multiple random members from a set (<http://redis.io/commands/srandmember>). The Redis command @SRANDMEMBER@ is split up into 'srandmember', 'srandmemberN'. Since Redis 1.0.0
srem, -- |Remove one or more members from a set (<http://redis.io/commands/srem>). Since Redis 1.0.0
sscan, -- |Incrementally iterate Set elements (<http://redis.io/commands/sscan>). The Redis command @SSCAN@ is split up into 'sscan', 'sscanOpts'. Since Redis 2.8.0
sscanOpts, -- |Incrementally iterate Set elements (<http://redis.io/commands/sscan>). The Redis command @SSCAN@ is split up into 'sscan', 'sscanOpts'. Since Redis 2.8.0
sunion, -- |Add multiple sets (<http://redis.io/commands/sunion>). Since Redis 1.0.0
sunionstore, -- |Add multiple sets and store the resulting set in a key (<http://redis.io/commands/sunionstore>). Since Redis 1.0.0

-- ** Sorted Sets
ZaddOpts(..),
defaultZaddOpts,
zadd, -- |Add one or more members to a sorted set, or update its score if it already exists (<http://redis.io/commands/zadd>). The Redis command @ZADD@ is split up into 'zadd', 'zaddOpts'. Since Redis 1.2.0
zaddOpts, -- |Add one or more members to a sorted set, or update its score if it already exists (<http://redis.io/commands/zadd>). The Redis command @ZADD@ is split up into 'zadd', 'zaddOpts'. Since Redis 1.2.0
zcard, -- |Get the number of members in a sorted set (<http://redis.io/commands/zcard>). Since Redis 1.2.0
zcount, -- |Count the members in a sorted set with scores within the given values (<http://redis.io/commands/zcount>). Since Redis 2.0.0
zincrby, -- |Increment the score of a member in a sorted set (<http://redis.io/commands/zincrby>). Since Redis 1.2.0
Aggregate(..),
zinterstore, -- |Intersect multiple sorted sets and store the resulting sorted set in a new key (<http://redis.io/commands/zinterstore>). The Redis command @ZINTERSTORE@ is split up into 'zinterstore', 'zinterstoreWeights'. Since Redis 2.0.0
zinterstoreWeights, -- |Intersect multiple sorted sets and store the resulting sorted set in a new key (<http://redis.io/commands/zinterstore>). The Redis command @ZINTERSTORE@ is split up into 'zinterstore', 'zinterstoreWeights'. Since Redis 2.0.0
zlexcount, -- |Count the number of members in a sorted set between a given lexicographical range (<http://redis.io/commands/zlexcount>). Since Redis 2.8.9
zrange, -- |Return a range of members in a sorted set, by index (<http://redis.io/commands/zrange>). The Redis command @ZRANGE@ is split up into 'zrange', 'zrangeWithscores'. Since Redis 1.2.0
zrangeWithscores, -- |Return a range of members in a sorted set, by index (<http://redis.io/commands/zrange>). The Redis command @ZRANGE@ is split up into 'zrange', 'zrangeWithscores'. Since Redis 1.2.0
RangeLex(..),
zrangebylex, zrangebylexLimit, -- |Return a range of members in a sorted set, by lexicographical range (<http://redis.io/commands/zrangebylex>). Since Redis 2.8.9
zrangebyscore, -- |Return a range of members in a sorted set, by score (<http://redis.io/commands/zrangebyscore>). The Redis command @ZRANGEBYSCORE@ is split up into 'zrangebyscore', 'zrangebyscoreWithscores', 'zrangebyscoreLimit', 'zrangebyscoreWithscoresLimit'. Since Redis 1.0.5
zrangebyscoreWithscores, -- |Return a range of members in a sorted set, by score (<http://redis.io/commands/zrangebyscore>). The Redis command @ZRANGEBYSCORE@ is split up into 'zrangebyscore', 'zrangebyscoreWithscores', 'zrangebyscoreLimit', 'zrangebyscoreWithscoresLimit'. Since Redis 1.0.5
zrangebyscoreLimit, -- |Return a range of members in a sorted set, by score (<http://redis.io/commands/zrangebyscore>). The Redis command @ZRANGEBYSCORE@ is split up into 'zrangebyscore', 'zrangebyscoreWithscores', 'zrangebyscoreLimit', 'zrangebyscoreWithscoresLimit'. Since Redis 1.0.5
zrangebyscoreWithscoresLimit, -- |Return a range of members in a sorted set, by score (<http://redis.io/commands/zrangebyscore>). The Redis command @ZRANGEBYSCORE@ is split up into 'zrangebyscore', 'zrangebyscoreWithscores', 'zrangebyscoreLimit', 'zrangebyscoreWithscoresLimit'. Since Redis 1.0.5
zrank, -- |Determine the index of a member in a sorted set (<http://redis.io/commands/zrank>). Since Redis 2.0.0
zrem, -- |Remove one or more members from a sorted set (<http://redis.io/commands/zrem>). Since Redis 1.2.0
zremrangebylex, -- |Remove all members in a sorted set between the given lexicographical range (<http://redis.io/commands/zremrangebylex>). Since Redis 2.8.9
zremrangebyrank, -- |Remove all members in a sorted set within the given indexes (<http://redis.io/commands/zremrangebyrank>). Since Redis 2.0.0
zremrangebyscore, -- |Remove all members in a sorted set within the given scores (<http://redis.io/commands/zremrangebyscore>). Since Redis 1.2.0
zrevrange, -- |Return a range of members in a sorted set, by index, with scores ordered from high to low (<http://redis.io/commands/zrevrange>). The Redis command @ZREVRANGE@ is split up into 'zrevrange', 'zrevrangeWithscores'. Since Redis 1.2.0
zrevrangeWithscores, -- |Return a range of members in a sorted set, by index, with scores ordered from high to low (<http://redis.io/commands/zrevrange>). The Redis command @ZREVRANGE@ is split up into 'zrevrange', 'zrevrangeWithscores'. Since Redis 1.2.0
zrevrangebyscore, -- |Return a range of members in a sorted set, by score, with scores ordered from high to low (<http://redis.io/commands/zrevrangebyscore>). The Redis command @ZREVRANGEBYSCORE@ is split up into 'zrevrangebyscore', 'zrevrangebyscoreWithscores', 'zrevrangebyscoreLimit', 'zrevrangebyscoreWithscoresLimit'. Since Redis 2.2.0
zrevrangebyscoreWithscores, -- |Return a range of members in a sorted set, by score, with scores ordered from high to low (<http://redis.io/commands/zrevrangebyscore>). The Redis command @ZREVRANGEBYSCORE@ is split up into 'zrevrangebyscore', 'zrevrangebyscoreWithscores', 'zrevrangebyscoreLimit', 'zrevrangebyscoreWithscoresLimit'. Since Redis 2.2.0
zrevrangebyscoreLimit, -- |Return a range of members in a sorted set, by score, with scores ordered from high to low (<http://redis.io/commands/zrevrangebyscore>). The Redis command @ZREVRANGEBYSCORE@ is split up into 'zrevrangebyscore', 'zrevrangebyscoreWithscores', 'zrevrangebyscoreLimit', 'zrevrangebyscoreWithscoresLimit'. Since Redis 2.2.0
zrevrangebyscoreWithscoresLimit, -- |Return a range of members in a sorted set, by score, with scores ordered from high to low (<http://redis.io/commands/zrevrangebyscore>). The Redis command @ZREVRANGEBYSCORE@ is split up into 'zrevrangebyscore', 'zrevrangebyscoreWithscores', 'zrevrangebyscoreLimit', 'zrevrangebyscoreWithscoresLimit'. Since Redis 2.2.0
zrevrank, -- |Determine the index of a member in a sorted set, with scores ordered from high to low (<http://redis.io/commands/zrevrank>). Since Redis 2.0.0
zscan, -- |Incrementally iterate sorted sets elements and associated scores (<http://redis.io/commands/zscan>). The Redis command @ZSCAN@ is split up into 'zscan', 'zscanOpts'. Since Redis 2.8.0
zscanOpts, -- |Incrementally iterate sorted sets elements and associated scores (<http://redis.io/commands/zscan>). The Redis command @ZSCAN@ is split up into 'zscan', 'zscanOpts'. Since Redis 2.8.0
zscore, -- |Get the score associated with the given member in a sorted set (<http://redis.io/commands/zscore>). Since Redis 1.2.0
zunionstore, -- |Add multiple sorted sets and store the resulting sorted set in a new key (<http://redis.io/commands/zunionstore>). The Redis command @ZUNIONSTORE@ is split up into 'zunionstore', 'zunionstoreWeights'. Since Redis 2.0.0
zunionstoreWeights, -- |Add multiple sorted sets and store the resulting sorted set in a new key (<http://redis.io/commands/zunionstore>). The Redis command @ZUNIONSTORE@ is split up into 'zunionstore', 'zunionstoreWeights'. Since Redis 2.0.0

-- ** Strings
append, -- |Append a value to a key (<http://redis.io/commands/append>). Since Redis 2.0.0
bitcount, -- |Count set bits in a string (<http://redis.io/commands/bitcount>). The Redis command @BITCOUNT@ is split up into 'bitcount', 'bitcountRange'. Since Redis 2.6.0
bitcountRange, -- |Count set bits in a string (<http://redis.io/commands/bitcount>). The Redis command @BITCOUNT@ is split up into 'bitcount', 'bitcountRange'. Since Redis 2.6.0
bitopAnd, -- |Perform bitwise operations between strings (<http://redis.io/commands/bitop>). The Redis command @BITOP@ is split up into 'bitopAnd', 'bitopOr', 'bitopXor', 'bitopNot'. Since Redis 2.6.0
bitopOr, -- |Perform bitwise operations between strings (<http://redis.io/commands/bitop>). The Redis command @BITOP@ is split up into 'bitopAnd', 'bitopOr', 'bitopXor', 'bitopNot'. Since Redis 2.6.0
bitopXor, -- |Perform bitwise operations between strings (<http://redis.io/commands/bitop>). The Redis command @BITOP@ is split up into 'bitopAnd', 'bitopOr', 'bitopXor', 'bitopNot'. Since Redis 2.6.0
bitopNot, -- |Perform bitwise operations between strings (<http://redis.io/commands/bitop>). The Redis command @BITOP@ is split up into 'bitopAnd', 'bitopOr', 'bitopXor', 'bitopNot'. Since Redis 2.6.0
bitpos, -- |Find first bit set or clear in a string (<http://redis.io/commands/bitpos>). Since Redis 2.8.7
decr, -- |Decrement the integer value of a key by one (<http://redis.io/commands/decr>). Since Redis 1.0.0
decrby, -- |Decrement the integer value of a key by the given number (<http://redis.io/commands/decrby>). Since Redis 1.0.0
get, -- |Get the value of a key (<http://redis.io/commands/get>). Since Redis 1.0.0
getbit, -- |Returns the bit value at offset in the string value stored at key (<http://redis.io/commands/getbit>). Since Redis 2.2.0
getrange, -- |Get a substring of the string stored at a key (<http://redis.io/commands/getrange>). Since Redis 2.4.0
getset, -- |Set the string value of a key and return its old value (<http://redis.io/commands/getset>). Since Redis 1.0.0
incr, -- |Increment the integer value of a key by one (<http://redis.io/commands/incr>). Since Redis 1.0.0
incrby, -- |Increment the integer value of a key by the given amount (<http://redis.io/commands/incrby>). Since Redis 1.0.0
incrbyfloat, -- |Increment the float value of a key by the given amount (<http://redis.io/commands/incrbyfloat>). Since Redis 2.6.0
mget, -- |Get the values of all the given keys (<http://redis.io/commands/mget>). Since Redis 1.0.0
mset, -- |Set multiple keys to multiple values (<http://redis.io/commands/mset>). Since Redis 1.0.1
msetnx, -- |Set multiple keys to multiple values, only if none of the keys exist (<http://redis.io/commands/msetnx>). Since Redis 1.0.1
psetex, -- |Set the value and expiration in milliseconds of a key (<http://redis.io/commands/psetex>). Since Redis 2.6.0
Condition(..),
SetOpts(..),
set, -- |Set the string value of a key (<http://redis.io/commands/set>). The Redis command @SET@ is split up into 'set', 'setOpts'. Since Redis 1.0.0
setOpts, -- |Set the string value of a key (<http://redis.io/commands/set>). The Redis command @SET@ is split up into 'set', 'setOpts'. Since Redis 1.0.0
setbit, -- |Sets or clears the bit at offset in the string value stored at key (<http://redis.io/commands/setbit>). Since Redis 2.2.0
setex, -- |Set the value and expiration of a key (<http://redis.io/commands/setex>). Since Redis 2.0.0
setnx, -- |Set the value of a key, only if the key does not exist (<http://redis.io/commands/setnx>). Since Redis 1.0.0
setrange, -- |Overwrite part of a string at key starting at the specified offset (<http://redis.io/commands/setrange>). Since Redis 2.2.0
strlen, -- |Get the length of the value stored in a key (<http://redis.io/commands/strlen>). Since Redis 2.2.0

-- ** Streams
XReadOpts(..),
defaultXreadOpts,
XReadResponse(..),
StreamsRecord(..),
TrimOpts(..),
xadd, -- |Add a value to a stream (<https://redis.io/commands/xadd>). Since Redis 5.0.0
xaddOpts, -- |Add a value to a stream (<https://redis.io/commands/xadd>). The Redis command @XADD@ is split up into 'xadd', 'xaddOpts'. Since Redis 5.0.0
xread, -- |Read values from a stream (<https://redis.io/commands/xread>). The Redis command @XREAD@ is split up into 'xread', 'xreadOpts'. Since Redis 5.0.0
xreadOpts, -- |Read values from a stream (<https://redis.io/commands/xread>). The Redis command @XREAD@ is split up into 'xread', 'xreadOpts'. Since Redis 5.0.0
xreadGroup, -- |Read values from a stream as part of a consumer group (https://redis.io/commands/xreadgroup). The redis command @XREADGROUP@ is split up into 'xreadGroup' and 'xreadGroupOpts'. Since Redis 5.0.0
xreadGroupOpts, -- |Read values from a stream as part of a consumer group (https://redis.io/commands/xreadgroup). The redis command @XREADGROUP@ is split up into 'xreadGroup' and 'xreadGroupOpts'. Since Redis 5.0.0
xack, -- |Acknowledge receipt of a message as part of a consumer group. Since Redis 5.0.0
xgroupCreate, -- |Create a consumer group. The redis command @XGROUP@ is split up into 'xgroupCreate', 'xgroupSetId', 'xgroupDestroy', and 'xgroupDelConsumer'. Since Redis 5.0.0
xgroupSetId, -- |Set the id for a consumer group. The redis command @XGROUP@ is split up into 'xgroupCreate', 'xgroupSetId', 'xgroupDestroy', and 'xgroupDelConsumer'. Since Redis 5.0.0
xgroupDestroy, -- |Destroy a consumer group. The redis command @XGROUP@ is split up into 'xgroupCreate', 'xgroupSetId', 'xgroupDestroy', and 'xgroupDelConsumer'. Since Redis 5.0.0
xgroupDelConsumer, -- |Delete a consumer. The redis command @XGROUP@ is split up into 'xgroupCreate', 'xgroupSetId', 'xgroupDestroy', and 'xgroupDelConsumer'. Since Redis 5.0.0
xrange, -- |Read values from a stream within a range (https://redis.io/commands/xrange). Since Redis 5.0.0
xrevRange, -- |Read values from a stream within a range in reverse order (https://redis.io/commands/xrevrange). Since Redis 5.0.0
xlen, -- |Get the number of entries in a stream (https://redis.io/commands/xlen). Since Redis 5.0.0
XPendingSummaryResponse(..),
xpendingSummary, -- |Get information about pending messages (https://redis.io/commands/xpending). The Redis @XPENDING@ command is split into 'xpendingSummary' and 'xpendingDetail'. Since Redis 5.0.0
XPendingDetailRecord(..),
xpendingDetail, -- |Get detailed information about pending messages (https://redis.io/commands/xpending). The Redis @XPENDING@ command is split into 'xpendingSummary' and 'xpendingDetail'. Since Redis 5.0.0
XClaimOpts(..),
defaultXClaimOpts,
xclaim, -- |Change ownership of some messages to the given consumer, returning the updated messages. The Redis @XCLAIM@ command is split into 'xclaim' and 'xclaimJustIds'. Since Redis 5.0.0
xclaimJustIds, -- |Change ownership of some messages to the given consumer, returning only the changed message IDs. The Redis @XCLAIM@ command is split into 'xclaim' and 'xclaimJustIds'. Since Redis 5.0.0
XInfoConsumersResponse(..),
xinfoConsumers, -- |Get info about consumers in a group. The Redis command @XINFO@ is split into 'xinfoConsumers', 'xinfoGroups', and 'xinfoStream'. Since Redis 5.0.0
XInfoGroupsResponse(..),
xinfoGroups, -- |Get info about groups consuming from a stream. The Redis command @XINFO@ is split into 'xinfoConsumers', 'xinfoGroups', and 'xinfoStream'. Since Redis 5.0.0
XInfoStreamResponse(..),
xinfoStream, -- |Get info about a stream. The Redis command @XINFO@ is split into 'xinfoConsumers', 'xinfoGroups', and 'xinfoStream'. Since Redis 5.0.0
xdel, -- |Delete messages from a stream. Since Redis 5.0.0
xtrim, -- |Set the upper bound for number of messages in a stream. Since Redis 5.0.0
inf, -- |Constructor for `inf` Redis argument values
ClusterNodesResponse(..),
ClusterNodesResponseEntry(..),
ClusterNodesResponseSlotSpec(..),
clusterNodes,
ClusterSlotsResponse(..),
ClusterSlotsResponseEntry(..),
ClusterSlotsNode(..),
clusterSlots,
clusterSetSlotNode,
clusterSetSlotStable,
clusterSetSlotImporting,
clusterSetSlotMigrating,
clusterGetKeysInSlot,
command
-- * Unimplemented Commands
-- |These commands are not implemented, as of now. Library
--  users can implement these or other commands from
--  experimental Redis versions by using the 'sendRequest'
--  function.
--
-- * COMMAND (<http://redis.io/commands/command>)
--
--
-- * COMMAND GETKEYS (<http://redis.io/commands/command-getkeys>)
--
--
-- * ROLE (<http://redis.io/commands/role>)
--
--
-- * CLIENT KILL (<http://redis.io/commands/client-kill>)
--
--
-- * ZREVRANGEBYLEX (<http://redis.io/commands/zrevrangebylex>)
--
--
-- * ZRANGEBYSCORE (<http://redis.io/commands/zrangebyscore>)
--
--
-- * ZREVRANGEBYSCORE (<http://redis.io/commands/zrevrangebyscore>)
--
--
-- * MONITOR (<http://redis.io/commands/monitor>)
--
--
-- * SYNC (<http://redis.io/commands/sync>)
--
--
-- * SHUTDOWN (<http://redis.io/commands/shutdown>)
--
--
-- * DEBUG SEGFAULT (<http://redis.io/commands/debug-segfault>)
--
) where

import Prelude hiding (min,max)
import Data.ByteString (ByteString)
import Database.Redis.ManualCommands
import Database.Redis.Types
import Database.Redis.Core(sendRequest, RedisCtx)

ttl
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
ttl key = sendRequest (["TTL"] ++ [encode key] )

setnx
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ value
    -> m (f Bool)
setnx key value = sendRequest (["SETNX"] ++ [encode key] ++ [encode value] )

pttl
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
pttl key = sendRequest (["PTTL"] ++ [encode key] )

commandCount
    :: (RedisCtx m f)
    => m (f Integer)
commandCount  = sendRequest (["COMMAND","COUNT"] )

clientSetname
    :: (RedisCtx m f)
    => ByteString -- ^ connectionName
    -> m (f ByteString)
clientSetname connectionName = sendRequest (["CLIENT","SETNAME"] ++ [encode connectionName] )

zrank
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ member
    -> m (f (Maybe Integer))
zrank key member = sendRequest (["ZRANK"] ++ [encode key] ++ [encode member] )

zremrangebyscore
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Double -- ^ min
    -> Double -- ^ max
    -> m (f Integer)
zremrangebyscore key min max = sendRequest (["ZREMRANGEBYSCORE"] ++ [encode key] ++ [encode min] ++ [encode max] )

hkeys
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f [ByteString])
hkeys key = sendRequest (["HKEYS"] ++ [encode key] )

slaveof
    :: (RedisCtx m f)
    => ByteString -- ^ host
    -> ByteString -- ^ port
    -> m (f Status)
slaveof host port = sendRequest (["SLAVEOF"] ++ [encode host] ++ [encode port] )

rpushx
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ value
    -> m (f Integer)
rpushx key value = sendRequest (["RPUSHX"] ++ [encode key] ++ [encode value] )

debugObject
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f ByteString)
debugObject key = sendRequest (["DEBUG","OBJECT"] ++ [encode key] )

bgsave
    :: (RedisCtx m f)
    => m (f Status)
bgsave  = sendRequest (["BGSAVE"] )

hlen
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
hlen key = sendRequest (["HLEN"] ++ [encode key] )

rpoplpush
    :: (RedisCtx m f)
    => ByteString -- ^ source
    -> ByteString -- ^ destination
    -> m (f (Maybe ByteString))
rpoplpush source destination = sendRequest (["RPOPLPUSH"] ++ [encode source] ++ [encode destination] )

brpop
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> Integer -- ^ timeout
    -> m (f (Maybe (ByteString,ByteString)))
brpop key timeout = sendRequest (["BRPOP"] ++ map encode key ++ [encode timeout] )

bgrewriteaof
    :: (RedisCtx m f)
    => m (f Status)
bgrewriteaof  = sendRequest (["BGREWRITEAOF"] )

zincrby
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ increment
    -> ByteString -- ^ member
    -> m (f Double)
zincrby key increment member = sendRequest (["ZINCRBY"] ++ [encode key] ++ [encode increment] ++ [encode member] )

hgetall
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f [(ByteString,ByteString)])
hgetall key = sendRequest (["HGETALL"] ++ [encode key] )

hmset
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [(ByteString,ByteString)] -- ^ fieldValue
    -> m (f Status)
hmset key fieldValue = sendRequest (["HMSET"] ++ [encode key] ++ concatMap (\(x,y) -> [encode x,encode y])fieldValue )

sinter
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> m (f [ByteString])
sinter key = sendRequest (["SINTER"] ++ map encode key )

pfadd
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ value
    -> m (f Integer)
pfadd key value = sendRequest (["PFADD"] ++ [encode key] ++ map encode value )

zremrangebyrank
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ start
    -> Integer -- ^ stop
    -> m (f Integer)
zremrangebyrank key start stop = sendRequest (["ZREMRANGEBYRANK"] ++ [encode key] ++ [encode start] ++ [encode stop] )

flushdb
    :: (RedisCtx m f)
    => m (f Status)
flushdb  = sendRequest (["FLUSHDB"] )

sadd
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ member
    -> m (f Integer)
sadd key member = sendRequest (["SADD"] ++ [encode key] ++ map encode member )

lindex
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ index
    -> m (f (Maybe ByteString))
lindex key index = sendRequest (["LINDEX"] ++ [encode key] ++ [encode index] )

lpush
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ value
    -> m (f Integer)
lpush key value = sendRequest (["LPUSH"] ++ [encode key] ++ map encode value )

hstrlen
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> m (f Integer)
hstrlen key field = sendRequest (["HSTRLEN"] ++ [encode key] ++ [encode field] )

smove
    :: (RedisCtx m f)
    => ByteString -- ^ source
    -> ByteString -- ^ destination
    -> ByteString -- ^ member
    -> m (f Bool)
smove source destination member = sendRequest (["SMOVE"] ++ [encode source] ++ [encode destination] ++ [encode member] )

zscore
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ member
    -> m (f (Maybe Double))
zscore key member = sendRequest (["ZSCORE"] ++ [encode key] ++ [encode member] )

configResetstat
    :: (RedisCtx m f)
    => m (f Status)
configResetstat  = sendRequest (["CONFIG","RESETSTAT"] )

pfcount
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> m (f Integer)
pfcount key = sendRequest (["PFCOUNT"] ++ map encode key )

hdel
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ field
    -> m (f Integer)
hdel key field = sendRequest (["HDEL"] ++ [encode key] ++ map encode field )

incrbyfloat
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Double -- ^ increment
    -> m (f Double)
incrbyfloat key increment = sendRequest (["INCRBYFLOAT"] ++ [encode key] ++ [encode increment] )

setbit
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ offset
    -> ByteString -- ^ value
    -> m (f Integer)
setbit key offset value = sendRequest (["SETBIT"] ++ [encode key] ++ [encode offset] ++ [encode value] )

flushall
    :: (RedisCtx m f)
    => m (f Status)
flushall  = sendRequest (["FLUSHALL"] )

incrby
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ increment
    -> m (f Integer)
incrby key increment = sendRequest (["INCRBY"] ++ [encode key] ++ [encode increment] )

time
    :: (RedisCtx m f)
    => m (f (Integer,Integer))
time  = sendRequest (["TIME"] )

smembers
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f [ByteString])
smembers key = sendRequest (["SMEMBERS"] ++ [encode key] )

zlexcount
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ min
    -> ByteString -- ^ max
    -> m (f Integer)
zlexcount key min max = sendRequest (["ZLEXCOUNT"] ++ [encode key] ++ [encode min] ++ [encode max] )

sunion
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> m (f [ByteString])
sunion key = sendRequest (["SUNION"] ++ map encode key )

sinterstore
    :: (RedisCtx m f)
    => ByteString -- ^ destination
    -> [ByteString] -- ^ key
    -> m (f Integer)
sinterstore destination key = sendRequest (["SINTERSTORE"] ++ [encode destination] ++ map encode key )

hvals
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f [ByteString])
hvals key = sendRequest (["HVALS"] ++ [encode key] )

configSet
    :: (RedisCtx m f)
    => ByteString -- ^ parameter
    -> ByteString -- ^ value
    -> m (f Status)
configSet parameter value = sendRequest (["CONFIG","SET"] ++ [encode parameter] ++ [encode value] )

scriptFlush
    :: (RedisCtx m f)
    => m (f Status)
scriptFlush  = sendRequest (["SCRIPT","FLUSH"] )

dbsize
    :: (RedisCtx m f)
    => m (f Integer)
dbsize  = sendRequest (["DBSIZE"] )

wait
    :: (RedisCtx m f)
    => Integer -- ^ numslaves
    -> Integer -- ^ timeout
    -> m (f Integer)
wait numslaves timeout = sendRequest (["WAIT"] ++ [encode numslaves] ++ [encode timeout] )

lpop
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f (Maybe ByteString))
lpop key = sendRequest (["LPOP"] ++ [encode key] )

clientPause
    :: (RedisCtx m f)
    => Integer -- ^ timeout
    -> m (f Status)
clientPause timeout = sendRequest (["CLIENT","PAUSE"] ++ [encode timeout] )

expire
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ seconds
    -> m (f Bool)
expire key seconds = sendRequest (["EXPIRE"] ++ [encode key] ++ [encode seconds] )

mget
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> m (f [Maybe ByteString])
mget key = sendRequest (["MGET"] ++ map encode key )

bitpos
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ bit
    -> Integer -- ^ start
    -> Integer -- ^ end
    -> m (f Integer)
bitpos key bit start end = sendRequest (["BITPOS"] ++ [encode key] ++ [encode bit] ++ [encode start] ++ [encode end] )

lastsave
    :: (RedisCtx m f)
    => m (f Integer)
lastsave  = sendRequest (["LASTSAVE"] )

pexpire
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ milliseconds
    -> m (f Bool)
pexpire key milliseconds = sendRequest (["PEXPIRE"] ++ [encode key] ++ [encode milliseconds] )

clientList
    :: (RedisCtx m f)
    => m (f [ByteString])
clientList  = sendRequest (["CLIENT","LIST"] )

renamenx
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ newkey
    -> m (f Bool)
renamenx key newkey = sendRequest (["RENAMENX"] ++ [encode key] ++ [encode newkey] )

pfmerge
    :: (RedisCtx m f)
    => ByteString -- ^ destkey
    -> [ByteString] -- ^ sourcekey
    -> m (f ByteString)
pfmerge destkey sourcekey = sendRequest (["PFMERGE"] ++ [encode destkey] ++ map encode sourcekey )

lrem
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ count
    -> ByteString -- ^ value
    -> m (f Integer)
lrem key count value = sendRequest (["LREM"] ++ [encode key] ++ [encode count] ++ [encode value] )

sdiff
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> m (f [ByteString])
sdiff key = sendRequest (["SDIFF"] ++ map encode key )

get
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f (Maybe ByteString))
get key = sendRequest (["GET"] ++ [encode key] )

getrange
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ start
    -> Integer -- ^ end
    -> m (f ByteString)
getrange key start end = sendRequest (["GETRANGE"] ++ [encode key] ++ [encode start] ++ [encode end] )

sdiffstore
    :: (RedisCtx m f)
    => ByteString -- ^ destination
    -> [ByteString] -- ^ key
    -> m (f Integer)
sdiffstore destination key = sendRequest (["SDIFFSTORE"] ++ [encode destination] ++ map encode key )

zcount
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Double -- ^ min
    -> Double -- ^ max
    -> m (f Integer)
zcount key min max = sendRequest (["ZCOUNT"] ++ [encode key] ++ [encode min] ++ [encode max] )

scriptLoad
    :: (RedisCtx m f)
    => ByteString -- ^ script
    -> m (f ByteString)
scriptLoad script = sendRequest (["SCRIPT","LOAD"] ++ [encode script] )

getset
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ value
    -> m (f (Maybe ByteString))
getset key value = sendRequest (["GETSET"] ++ [encode key] ++ [encode value] )

dump
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f ByteString)
dump key = sendRequest (["DUMP"] ++ [encode key] )

keys
    :: (RedisCtx m f)
    => ByteString -- ^ pattern
    -> m (f [ByteString])
keys pattern = sendRequest (["KEYS"] ++ [encode pattern] )

configGet
    :: (RedisCtx m f)
    => ByteString -- ^ parameter
    -> m (f [(ByteString,ByteString)])
configGet parameter = sendRequest (["CONFIG","GET"] ++ [encode parameter] )

rpush
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ value
    -> m (f Integer)
rpush key value = sendRequest (["RPUSH"] ++ [encode key] ++ map encode value )

randomkey
    :: (RedisCtx m f)
    => m (f (Maybe ByteString))
randomkey  = sendRequest (["RANDOMKEY"] )

hsetnx
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> ByteString -- ^ value
    -> m (f Bool)
hsetnx key field value = sendRequest (["HSETNX"] ++ [encode key] ++ [encode field] ++ [encode value] )

mset
    :: (RedisCtx m f)
    => [(ByteString,ByteString)] -- ^ keyValue
    -> m (f Status)
mset keyValue = sendRequest (["MSET"] ++ concatMap (\(x,y) -> [encode x,encode y])keyValue )

setex
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ seconds
    -> ByteString -- ^ value
    -> m (f Status)
setex key seconds value = sendRequest (["SETEX"] ++ [encode key] ++ [encode seconds] ++ [encode value] )

psetex
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ milliseconds
    -> ByteString -- ^ value
    -> m (f Status)
psetex key milliseconds value = sendRequest (["PSETEX"] ++ [encode key] ++ [encode milliseconds] ++ [encode value] )

scard
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
scard key = sendRequest (["SCARD"] ++ [encode key] )

scriptExists
    :: (RedisCtx m f)
    => [ByteString] -- ^ script
    -> m (f [Bool])
scriptExists script = sendRequest (["SCRIPT","EXISTS"] ++ map encode script )

sunionstore
    :: (RedisCtx m f)
    => ByteString -- ^ destination
    -> [ByteString] -- ^ key
    -> m (f Integer)
sunionstore destination key = sendRequest (["SUNIONSTORE"] ++ [encode destination] ++ map encode key )

persist
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Bool)
persist key = sendRequest (["PERSIST"] ++ [encode key] )

strlen
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
strlen key = sendRequest (["STRLEN"] ++ [encode key] )

lpushx
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ value
    -> m (f Integer)
lpushx key value = sendRequest (["LPUSHX"] ++ [encode key] ++ [encode value] )

hset
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> ByteString -- ^ value
    -> m (f Integer)
hset key field value = sendRequest (["HSET"] ++ [encode key] ++ [encode field] ++ [encode value] )

brpoplpush
    :: (RedisCtx m f)
    => ByteString -- ^ source
    -> ByteString -- ^ destination
    -> Integer -- ^ timeout
    -> m (f (Maybe ByteString))
brpoplpush source destination timeout = sendRequest (["BRPOPLPUSH"] ++ [encode source] ++ [encode destination] ++ [encode timeout] )

zrevrank
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ member
    -> m (f (Maybe Integer))
zrevrank key member = sendRequest (["ZREVRANK"] ++ [encode key] ++ [encode member] )

scriptKill
    :: (RedisCtx m f)
    => m (f Status)
scriptKill  = sendRequest (["SCRIPT","KILL"] )

setrange
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ offset
    -> ByteString -- ^ value
    -> m (f Integer)
setrange key offset value = sendRequest (["SETRANGE"] ++ [encode key] ++ [encode offset] ++ [encode value] )

del
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> m (f Integer)
del key = sendRequest (["DEL"] ++ map encode key )

hincrbyfloat
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> Double -- ^ increment
    -> m (f Double)
hincrbyfloat key field increment = sendRequest (["HINCRBYFLOAT"] ++ [encode key] ++ [encode field] ++ [encode increment] )

hincrby
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> Integer -- ^ increment
    -> m (f Integer)
hincrby key field increment = sendRequest (["HINCRBY"] ++ [encode key] ++ [encode field] ++ [encode increment] )

zremrangebylex
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ min
    -> ByteString -- ^ max
    -> m (f Integer)
zremrangebylex key min max = sendRequest (["ZREMRANGEBYLEX"] ++ [encode key] ++ [encode min] ++ [encode max] )

rpop
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f (Maybe ByteString))
rpop key = sendRequest (["RPOP"] ++ [encode key] )

rename
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ newkey
    -> m (f Status)
rename key newkey = sendRequest (["RENAME"] ++ [encode key] ++ [encode newkey] )

zrem
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ member
    -> m (f Integer)
zrem key member = sendRequest (["ZREM"] ++ [encode key] ++ map encode member )

hexists
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> m (f Bool)
hexists key field = sendRequest (["HEXISTS"] ++ [encode key] ++ [encode field] )

clientGetname
    :: (RedisCtx m f)
    => m (f Status)
clientGetname  = sendRequest (["CLIENT","GETNAME"] )

configRewrite
    :: (RedisCtx m f)
    => m (f Status)
configRewrite  = sendRequest (["CONFIG","REWRITE"] )

decr
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
decr key = sendRequest (["DECR"] ++ [encode key] )

hmget
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ field
    -> m (f [Maybe ByteString])
hmget key field = sendRequest (["HMGET"] ++ [encode key] ++ map encode field )

lrange
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ start
    -> Integer -- ^ stop
    -> m (f [ByteString])
lrange key start stop = sendRequest (["LRANGE"] ++ [encode key] ++ [encode start] ++ [encode stop] )

decrby
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ decrement
    -> m (f Integer)
decrby key decrement = sendRequest (["DECRBY"] ++ [encode key] ++ [encode decrement] )

llen
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
llen key = sendRequest (["LLEN"] ++ [encode key] )

append
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ value
    -> m (f Integer)
append key value = sendRequest (["APPEND"] ++ [encode key] ++ [encode value] )

incr
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
incr key = sendRequest (["INCR"] ++ [encode key] )

hget
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ field
    -> m (f (Maybe ByteString))
hget key field = sendRequest (["HGET"] ++ [encode key] ++ [encode field] )

pexpireat
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ millisecondsTimestamp
    -> m (f Bool)
pexpireat key millisecondsTimestamp = sendRequest (["PEXPIREAT"] ++ [encode key] ++ [encode millisecondsTimestamp] )

ltrim
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ start
    -> Integer -- ^ stop
    -> m (f Status)
ltrim key start stop = sendRequest (["LTRIM"] ++ [encode key] ++ [encode start] ++ [encode stop] )

zcard
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> m (f Integer)
zcard key = sendRequest (["ZCARD"] ++ [encode key] )

lset
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ index
    -> ByteString -- ^ value
    -> m (f Status)
lset key index value = sendRequest (["LSET"] ++ [encode key] ++ [encode index] ++ [encode value] )

expireat
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ timestamp
    -> m (f Bool)
expireat key timestamp = sendRequest (["EXPIREAT"] ++ [encode key] ++ [encode timestamp] )

save
    :: (RedisCtx m f)
    => m (f Status)
save  = sendRequest (["SAVE"] )

move
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ db
    -> m (f Bool)
move key db = sendRequest (["MOVE"] ++ [encode key] ++ [encode db] )

getbit
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> Integer -- ^ offset
    -> m (f Integer)
getbit key offset = sendRequest (["GETBIT"] ++ [encode key] ++ [encode offset] )

msetnx
    :: (RedisCtx m f)
    => [(ByteString,ByteString)] -- ^ keyValue
    -> m (f Bool)
msetnx keyValue = sendRequest (["MSETNX"] ++ concatMap (\(x,y) -> [encode x,encode y])keyValue )

commandInfo
    :: (RedisCtx m f)
    => [ByteString] -- ^ commandName
    -> m (f [ByteString])
commandInfo commandName = sendRequest (["COMMAND","INFO"] ++ map encode commandName )

quit
    :: (RedisCtx m f)
    => m (f Status)
quit  = sendRequest (["QUIT"] )

blpop
    :: (RedisCtx m f)
    => [ByteString] -- ^ key
    -> Integer -- ^ timeout
    -> m (f (Maybe (ByteString,ByteString)))
blpop key timeout = sendRequest (["BLPOP"] ++ map encode key ++ [encode timeout] )

srem
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> [ByteString] -- ^ member
    -> m (f Integer)
srem key member = sendRequest (["SREM"] ++ [encode key] ++ map encode member )

echo
    :: (RedisCtx m f)
    => ByteString -- ^ message
    -> m (f ByteString)
echo message = sendRequest (["ECHO"] ++ [encode message] )

sismember
    :: (RedisCtx m f)
    => ByteString -- ^ key
    -> ByteString -- ^ member
    -> m (f Bool)
sismember key member = sendRequest (["SISMEMBER"] ++ [encode key] ++ [encode member] )
