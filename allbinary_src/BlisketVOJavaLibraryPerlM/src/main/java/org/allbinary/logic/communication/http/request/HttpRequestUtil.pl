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

package org::allbinary::logic::communication::http::request::HttpRequestUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::request::HttpRequestUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::request::HttpRequestUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getLastSeparatorIndex {
    my ($self, $requestPath) = @_;
        my $beginIndex = rindex($requestPath, 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        if ($beginIndex < 0) {
            $beginIndex = rindex($requestPath, "\\");
        }
        return $beginIndex;
}


# throws Exception
sub generateFileName {
    my ($self, $requestPath) = @_;
        my $beginIndex = $self->getLastSeparatorIndex($requestPath);
        if ($beginIndex < 0) {
            return $requestPath;
        } else {
            return substr($requestPath, $beginIndex + 1);
        }
}

use org::allbinary::logic::io::path::AbPathData;

1;

