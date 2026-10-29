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

package org::allbinary::logic::java::anyType::ParamsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub viewParams {
    my ($class, $params) = @_;
        if (defined($params)) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            for (my $index = 0; $index < scalar(@{$params}); $index++) {
                $stringBuffer->append(" ");
                $stringBuffer->append($params->[$index]->getName());
            }
            return $stringBuffer->toString();
        } else {
            return "Params Null";
        }
}

use org::allbinary::logic::string::StringMaker;

1;

