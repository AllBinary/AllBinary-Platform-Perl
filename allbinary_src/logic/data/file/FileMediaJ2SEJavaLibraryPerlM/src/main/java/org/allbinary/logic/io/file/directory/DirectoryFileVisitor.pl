# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
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

package org::allbinary::logic::io::file::directory::DirectoryFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::VisitorInterface','java::io::FileFilter';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub accept {
    my ($self, $arg0) = @_;
        return ($self->visit($arg0));
}


sub visit {
    my ($self, $anyType) = @_;
        my $file = $anyType;
        my $index = 1;
        my $aFile = $file->getParentFile();
        while (defined((($aFile = $aFile->getParentFile())))) {
            $index++;
        }
        if ($file->isDirectory() && $index < 5) {
            return 1;
        }
        return 0;
}

use java::io::File;
# use java::io::FileFilter;
use org::allbinary::logic::util::visitor::VisitorInterface;

1;

