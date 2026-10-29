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

package org::allbinary::game::combat::destroy::DestroyableBaseBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::combat::destroy::DestroyableInterface';

our $instance = 'org::allbinary::game::combat::destroy::DestroyableBaseBehavior'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::destroy::DestroyableBaseBehavior::instance;
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


# throws Exception
sub isDestroyed {
    my ($self) = @_;
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::game::combat::destroy::DestroyableInterface;

1;

