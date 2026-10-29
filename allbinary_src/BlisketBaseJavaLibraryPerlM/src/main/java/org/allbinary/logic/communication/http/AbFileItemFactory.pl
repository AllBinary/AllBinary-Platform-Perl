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

package org::allbinary::logic::communication::http::AbFileItemFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::apache::commons::fileupload::DefaultFileItemFactory';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        # super(...) made $self above
    return $self;
}

use org::apache::commons::fileupload::DefaultFileItemFactory;

1;

