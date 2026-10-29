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

# Java interface
package org::allbinary::game::resource::ResourceRelativeRelationshipFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::feature::GameFeatureControlledInterface';



# throws Exception
sub getResourceRelativeRelationshipList {
    my ($self, $resource) = @_;
    die "abstract method getResourceRelativeRelationshipList";
}


# throws Exception
sub addResourceRelativeRelationship {
    my ($self, $resource, $relativeRelationship) = @_;
    die "abstract method addResourceRelativeRelationship";
}

use org::allbinary::game::configuration::feature::GameFeatureControlledInterface;
use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::util::BasicArrayList;

1;

