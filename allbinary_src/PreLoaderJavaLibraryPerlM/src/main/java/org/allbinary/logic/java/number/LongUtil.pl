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

package org::allbinary::logic::java::number::LongUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub fillIn {
    my ($class, $end) = @_;
        my $frameStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if ($frameStringBuffer->length() < $org::allbinary::logic::java::number::LongData::MAX_LONG_LENGTH) {
            my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
            my $size = $org::allbinary::logic::java::number::LongData::MAX_LONG_LENGTH - $frameStringBuffer->length();
            for (my $index = 0; $index < $size; $index++) {
                $frameStringBuffer->append($commonPhoneStrings->{ZERO});
            }
        }
        $frameStringBuffer->append($end);
        return $frameStringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::logic::java::number::LongData;

1;

