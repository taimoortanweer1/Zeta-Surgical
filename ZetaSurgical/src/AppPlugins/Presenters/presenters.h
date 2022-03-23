#ifndef Presenters_H
#define Presenters_H

#include <applicationplugininterface.h>

class Presenters : public QObject, public ApplicationPluginInterface
{
    Q_OBJECT
    Q_DISABLE_COPY(Presenters)
    Q_PLUGIN_METADATA(IID ApplicationPluginInterface_iid FILE "Presenters.json")
    Q_INTERFACES(ApplicationPluginInterface)

public:
    explicit Presenters(QObject *parent = nullptr);

    // ApplicationPluginInterface interface
public:
    void populateContext(GreenHouse::Context *context) override;
    void resolveDependencies(GreenHouse::Context *context) override;
};

#endif // Presenters_H
