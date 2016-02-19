;; This contains a list of projects you have visited.
(setq project_file "/home/test/workshop/test_cpp/SConscript")
(setq external_include "_external/usr/local/include/")
(setq project_path (file-name-directory project_file))

(ede-cpp-root-project "test_cpp"
                      :file project_file
                      :include-path '( "/include" "/src" ".")
                      :system-include-path (list "/usr/include"
                                                 "/usr/include/gnu"
                                                 "/usr/local/include"
                                                 "/usr/include/c++/4.1.2"
                                                 "/usr/include/c++"
                                                 "/usr/include"
                                                 (message "%s%s" project_path external_include))
                      )
