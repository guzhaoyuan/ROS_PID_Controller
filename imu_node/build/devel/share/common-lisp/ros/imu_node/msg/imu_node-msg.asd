
(cl:in-package :asdf)

(defsystem "imu_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "real_pose" :depends-on ("_package_real_pose"))
    (:file "_package_real_pose" :depends-on ("_package"))
  ))