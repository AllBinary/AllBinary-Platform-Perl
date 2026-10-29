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

package org::allbinary::logic::communication::http::file::upload::HttpFilePermissions;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{file} = undef;
    $self->{userRoles} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class, $fullPath) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{file} = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath('org::allbinary::logic::io::path::AbPath'->new($fullPath->toFileSystemString(), 'org::allbinary::logic::communication::http::file::upload::FileUploadData'->getInstance()->{FILE}));
        if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
            $self->{logUtil}->putF("Loading Privileges: " . $fullPath->toFileSystemString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        if ($self->isFile()) {
            $self->{userRoles}->add('org::allbinary::business::user::role::BasicUserRoleFactory'->getInstance()->{ADMINISTRATOR});
        }
        if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
            $self->{logUtil}->putF("User Roles: " . $self->{userRoles}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub isFile {
    my ($self) = @_;
        return $self->{file}->isFile();
}


sub getUserRoles {
    my ($self) = @_;
        return $self->{userRoles};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::role::BasicUserRoleFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::http::file::upload::FileUploadData;

1;

