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

package org::allbinary::business::installer::InitializeCloud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $CLOUD = "cloud/";
our $CLOUD_UPDATE = "cloudupdate/";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub initialize {
    my ($self, $cloud, $overwriteNewer, $overwriteAll, $current, $total) = @_;
        try {
            if ('org::allbinary::logic::io::AbIOSystem'->getInstance()->isType("com.vobject.appengine.java.io")) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
                $stringBuffer->append($cloud);
                $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{DATA_PATH});
                my $path = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
                my $realPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($path);
                my $fileBasicArrayList = 'org::allbinary::logic::io::file::directory::Directory'->getInstance()->search($file, 1);
                my $size = $fileBasicArrayList->size();
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append("Searched: ");
                $stringBuffer->append($path->toFileSystemString());
                $stringBuffer->append(" BasicArrayList: ");
                $stringBuffer->appendint($size);
                my $portion = int($size / $total) + 1;
                my $start = $portion * $current;
                my $end = $start + $portion;
                if ($end > $size) {
                    $end = $size;
                }
                $stringBuffer->append(" Section: ");
                $stringBuffer->appendint($start);
                $stringBuffer->append(" - ");
                $stringBuffer->appendint($end);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "initialize()");
                my $nextFile = undef;
                for (my $index = $start; $index < $end; $index++) {
                    $nextFile = $fileBasicArrayList->get($index);
                    if ($nextFile->isDirectory()) {
                    } else {
                        'org::allbinary::logic::io::file::FileUtil'->getInstance()->copyToCloud($nextFile, $path, $realPath, $cloud, $overwriteNewer, $overwriteAll);
                    }
                }
                $self->{logUtil}->putF("Copied Files To Cloud", $self, "initialize()");
            }
            return 1;
        } catch ($e) {
            $self->{logUtil}->put("Unable to copy installer files into cloud", $self, "initialize()", $e);
            return 0;
        }
}

use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbIOSystem;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;

1;

