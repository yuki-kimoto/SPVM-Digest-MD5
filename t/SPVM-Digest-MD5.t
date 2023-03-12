use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";

use Test::More;

use SPVM 'TestCase::Digest::MD5';

# Start objects count
my $start_memory_blocks_count = SPVM::get_memory_blocks_count();

# SPVM::Digest::MD5
{
  ok(SPVM::TestCase::Digest::MD5->md5());
  ok(SPVM::TestCase::Digest::MD5->md5_hex());
  ok(SPVM::TestCase::Digest::MD5->md5_base64());
  ok(SPVM::TestCase::Digest::MD5->add());
}

# All object is freed
my $end_memory_blocks_count = SPVM::get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
