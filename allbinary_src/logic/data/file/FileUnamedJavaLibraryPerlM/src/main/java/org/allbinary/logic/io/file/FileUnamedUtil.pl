# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::logic::io::file::FileUnamedUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::FileUnamedUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileUnamedUtil::instance;
}


sub process {
    my ($self, $string) = @_;
        my $simplifiedString = lc($string);
        $simplifiedString = join($self->{commonSeps}->{UNDERSCORE}, split(quotemeta($self->{commonSeps}->{SPACE}), $simplifiedString, -1));
        $simplifiedString = join($self->{commonSeps}->{UNDERSCORE}, split(quotemeta($self->{commonSeps}->{DASH}), $simplifiedString, -1));
        return $simplifiedString;
}

use org::allbinary::string::CommonSeps;

1;

