#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::AndroidUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_ACTIVITY, 'java::lang::LazyStatic', sub { 'android::app::Activity'->new() };
tie our $version, 'java::lang::LazyStatic', sub { int($android::os::Build::VERSION->{SDK}) };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isMemoryRestrictive {
    my ($class) = @_;
        if ($org::allbinary::AndroidUtil::version < 30) {
            return 1;
        }
        return 0;
}


sub isAndroid {
    my ($class) = @_;
        return 1;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use android::app::Activity ();
# use android::os::Build ();

1;

