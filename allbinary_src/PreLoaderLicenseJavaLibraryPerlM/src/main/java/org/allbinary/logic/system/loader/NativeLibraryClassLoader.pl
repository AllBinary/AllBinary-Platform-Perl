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

package org::allbinary::logic::system::loader::NativeLibraryClassLoader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::loader::ClassLoader';


sub _init_fields {
    my ($self) = @_;
    $self->{message} = "This Class Loader Does Not Load Classes - Only For Loading and Unloading of Native Libraries";
}


sub new {
    my ($class, $parent) = @_;
    my $self = $class->SUPER::new($parent);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}

use org::allbinary::logic::system::loader::ClassLoader;

1;

