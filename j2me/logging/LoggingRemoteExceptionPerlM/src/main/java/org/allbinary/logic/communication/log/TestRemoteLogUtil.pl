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

package org::allbinary::logic::communication::log::TestRemoteLogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $PATH = "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
        'org::allbinary::globals::Globals'->getInstance()->init(ref($self)->getClassLoader(), $org::allbinary::logic::communication::log::TestRemoteLogUtil::PATH);
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->put($commonStrings->{EXCEPTION}, "Test", "TestClass", ("Pretend Exception"));
    return $self;
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        'org::allbinary::logic::communication::log::TestRemoteLogUtil'->new();
}

use org::allbinary::globals::Globals;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;

1;

