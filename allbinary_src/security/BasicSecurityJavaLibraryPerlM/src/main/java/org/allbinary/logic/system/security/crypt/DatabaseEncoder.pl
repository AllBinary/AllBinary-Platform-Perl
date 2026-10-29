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

package org::allbinary::logic::system::security::crypt::DatabaseEncoder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub encode {
    my ($class, $value) = @_;
        try {
            my $array = $value;
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            for (my $index = 0; $index < scalar(@{$array}); $index++) {
                $stringBuffer->append($array->[$index]->toString());
                if ($index < scalar(@{$array}) - 1) {
                    $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
                }
            }
            return $stringBuffer->toString();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, "DatabaseEncoder", "decode", $e);
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}


sub decode {
    my ($class, $value) = @_;
        try {
            my $tokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            my $vector = $tokenizer->getTokensFromString($value, 'org::allbinary::util::BasicArrayListD'->new());
            my $byteVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $size = $vector->size();
            my $byteOfData = undef;
            for (my $index = 0; $index < $size; $index++) {
                $byteOfData = $vector->{objectArray}->[$index];
                $byteVector->add($byteOfData);
            }
            my $decode = [(0) x ($byteVector->size())];
            my $decodeIndex = 0;
            my $aByte = undef;
            for (my $index = 0; $index < $size; $index++) {
                $aByte = $byteVector->{objectArray}->[$index];
                $decode->[$decodeIndex] = int($aByte);
                $decodeIndex++;
            }
            return $decode;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putSE($commonStrings->{EXCEPTION}, "DatabaseEncoder", "decode", $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY};
        }
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

