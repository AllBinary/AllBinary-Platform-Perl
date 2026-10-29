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

package org::allbinary::logic::string::SpecialCharacterUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getHashMap {
    my ($class) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put("!", $stringUtil->{EMPTY_STRING});
        $hashMap->put("\@", $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonPhoneStrings->{POUND}, $stringUtil->{EMPTY_STRING});
        $hashMap->put("\$", $stringUtil->{EMPTY_STRING});
        $hashMap->put("%", $stringUtil->{EMPTY_STRING});
        $hashMap->put("^", $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonSeps->{AMPERSAND}, $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonPhoneStrings->{STAR}, $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonSeps->{PARENTHESIS_OPEN}, $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonSeps->{PARENTHESIS_CLOSE}, $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonSeps->{DASH}, $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonSeps->{UNDERSCORE}, $stringUtil->{EMPTY_STRING});
        $hashMap->put('org::allbinary::logic::math::MathData'->getInstance()->{PLUS}, $stringUtil->{EMPTY_STRING});
        $hashMap->put($commonSeps->{EQUALS}, $stringUtil->{EMPTY_STRING});
        $hashMap->put("\\", $stringUtil->{EMPTY_STRING});
        $hashMap->put("|", $stringUtil->{EMPTY_STRING});
        $hashMap->put('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP}, $stringUtil->{EMPTY_STRING});
        $hashMap->put(",", $stringUtil->{EMPTY_STRING});
        $hashMap->put("<", $stringUtil->{EMPTY_STRING});
        $hashMap->put(">", $stringUtil->{EMPTY_STRING});
        $hashMap->put("?", $stringUtil->{EMPTY_STRING});
        $hashMap->put('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR}, $stringUtil->{EMPTY_STRING});
        $hashMap->put("~", $stringUtil->{EMPTY_STRING});
        $hashMap->put("`", $stringUtil->{EMPTY_STRING});
        return $hashMap;
}

use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::math::MathData;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringUtil;

1;

