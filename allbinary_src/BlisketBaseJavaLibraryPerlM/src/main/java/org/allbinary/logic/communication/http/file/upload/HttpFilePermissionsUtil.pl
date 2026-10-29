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

package org::allbinary::logic::communication::http::file::upload::HttpFilePermissionsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::file::upload::HttpFilePermissionsUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::file::upload::HttpFilePermissionsUtil::instance;
}


# throws Exception
sub create {
    my ($self, $path) = @_;
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($path);
        if (!$file->isFile()) {
            $file->createNewFile();
        }
}

use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;

1;

