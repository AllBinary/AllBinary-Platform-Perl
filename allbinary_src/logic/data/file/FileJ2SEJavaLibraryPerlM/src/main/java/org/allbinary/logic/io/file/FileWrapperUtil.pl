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

package org::allbinary::logic::io::file::FileWrapperUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub wrapFiles {
    my ($class, $files) = @_;
        try {
            my $abFileArray = [(undef) x (scalar(@{$files}))];
            for (my $index = scalar(@{$files}) - 1; $index >= 0; $index--) {
                $abFileArray->[$index] = 'org::allbinary::logic::io::file::AbFile'->new($files->[$index]);
            }
            return $abFileArray;
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putSE("Exception Wrapping Files", "FileWrapperUtil", "wrapFiles", $e);
            return [(undef) x (0)];
        }
}


sub wrapFile {
    my ($class, $file) = @_;
        try {
            return 'org::allbinary::logic::io::file::AbFile'->new($file);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putSE("Exception Wrapping File", "FileWrapperUtil", "wrapFile", $e);
            return $org::allbinary::logic::io::file::AbFile::NULL_FILE;
        }
}

use java::io::File;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::io::file::AbFile;

1;

